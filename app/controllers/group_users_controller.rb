class GroupUsersController < ApplicationController
  
  def create
    @group = Group.find(params[:group_id])
    @group_user = GroupUser.new(user_id: current_user.id, group_id: @group.id)
    @group_user.save
    redirect_to groups_path
  end
  
  def destroy
    redirect_to groups_path
  end
  
end
