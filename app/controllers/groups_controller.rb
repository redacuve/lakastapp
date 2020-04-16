class GroupsController < ApplicationController
  before_action :logged_in_user
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
      flash[:success] = 'Program created successfully'
      redirect_to groups_path
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:user_id, :name, :icon, :icon_cache)
  end

  def set_group
    @group = Group.includes(records: :author).find(params[:id])
  end
end
