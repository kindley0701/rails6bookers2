class GroupsController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      redirect_to group_path(@group.id)
    else
      render :new
    end
  end

  def index
    @user = current_user
    @book = Book.new
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @user = User.find(@group.owner_id)
    @book = Book.new
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_path(@group.id)
    else
      render :edit
    end
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to groups_path
  end

  private
  def group_params
    params.require(:group).permit(:name, :introduction, :image)
  end

  def ensure_correct_user
    @group = Group.find(params[:id])
    @user = User.find(@group.owner_id)
    unless @user == current_user
      redirect_to users_path
    end
  end
end
