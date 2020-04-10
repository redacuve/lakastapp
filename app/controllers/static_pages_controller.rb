class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: [:dashboard]
  def index; end

  def login; end

  def create_login
    if (@user = User.find_by(email: params[:email]))
      login_user(@user)
      redirect_to dashboard_path
    else
      flash[:error] = "User doesn't exist"
      redirect_to login_path
    end
  end

  def logout
    logout_user
    redirect_to root_path
  end

  def dashboard; end
end
