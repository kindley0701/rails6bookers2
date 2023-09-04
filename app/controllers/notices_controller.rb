class NoticesController < ApplicationController
  def new
    @notice = Notice.new
    @group = Group.find(params[:group_id])
  end

  def create
    @notice = Notice.new(notice_params)
    @group = Group.find(params[:group_id])
    @notice.group_id = @group.id
    if @notice.save
      @group.group_users.each do |group_user| #グループ内のメンバーそれぞれに対してメールの送信を行っていく．
        user = User.find(group_user.user_id)
        ContactMailer.send_when_owner_announce(user, @group, @notice).deliver #メソッドはContactMailerで定義．deliverでメール送信実行
      end
      redirect_to group_notice_path(@group.id, @notice.id)
    else
      render :new
    end
  end

  def show
    @notice = Notice.find(params[:id])
  end

  private
  def notice_params
    params.require(:notice).permit(:title, :body)
  end
end
