class GroupsController < ApplicationController
  before_action :set_group, only: [:show]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def show; end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    if @group.save
      flash[:success] = 'Event created successfully'
      redirect_to groups_path
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:user_id, :name, :icon)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
