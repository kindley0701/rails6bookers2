class MessagesController < ApplicationController

  def index #相手とのメッセージ一覧(=DM部屋)
    @user = User.find(params[:user_id]) #DM相手
    room_id = current_user.room_users.pluck(:room_id) #ログインユーザーのDM部屋のidを一覧で取得
    room_user = @user.room_users.find_by(room_id: room_id) #その中から該当のDM相手とのDM部屋を検索
    if room_user
      @room = room_user.room
    else
      @room = Room.new
      @room.save
      RoomUser.create(user_id: @user.id, room_id: @room.id)
      RoomUser.create(user_id: current_user.id, room_id: @room.id)
    end
    @messages = @room.messages
    @message = Message.new
  end

  def create
    @user = User.find(params[:user_id])
    @message = Message.new(message_params)
    @message.save
    @room = @user.room_users.find_by(room_id: current_user.room_users.pluck(:room_id) ,user_id: @user.id).room
    @messages = @room.messages
  end

  private
  def message_params
    params.require(:message).permit(:body, :room_id, :user_id)
  end
end
