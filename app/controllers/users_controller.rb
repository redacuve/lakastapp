class UsersController < ApplicationController
  before_action :correct_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user(@user)
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to dashboard_path unless current_user?(@user)
  end

  def user_params
    params.require(:user).permit(:name, :email, :username)
  end
end
