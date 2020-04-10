class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: [:dashboard]
  def index; end

  def login; end

  def create_login
    if (@user = User.find_by(email: params[:email]))
      login @user
      redirect_to @user
    else
      flash[:error] = "User doesn't exist"
      redirect_to login_path
    end
  end

  def logout
    logout
    redirect_to root_path
  end

  def dashboard; end
end
