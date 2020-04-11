class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
  end

  def create
  end
end
