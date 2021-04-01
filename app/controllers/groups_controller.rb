class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @groups = Group.includes(:user).order('created_at DESC')
  end

  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
    @group_t = @group.accounts
    @total_g = @group_t.sum(:amount)
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      flash[:success] = 'Group was successfully created.'
      redirect_to groups_path
    else
      render :new

    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
