# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /groups or /groups.json
  def index
    @groups = Group.includes(:user).order(:name)
  end

  # GET /groups/1 or /groups/1.json
  def show
    # @transactions = Transaction.includes(:groups).where(user_id:current_user.id).joins(:groups)
    @group = Group.find(params[:id])
    @group_transactions = @group.transaction.order('created_at DESC')
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # POST /groups or /groups.json
  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      flash[:success] = 'Group was successfully created.'
    else
      render :new

    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
