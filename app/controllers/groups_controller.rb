class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

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
end
