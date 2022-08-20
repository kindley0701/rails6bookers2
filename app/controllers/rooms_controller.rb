class RoomsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @message = Message.new
  end
end
