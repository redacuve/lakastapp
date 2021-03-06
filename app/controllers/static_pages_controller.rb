class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: [:dashboard]
  def index; end

  def login; end

  def create_login
    email_user = params[:email].strip.downcase
    if (@user = User.find_by(email: email_user))
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

  def dashboard
    @allmyrecords = Record.all_my_total(current_user, 'desc')
    @hash = Record.mine(current_user).joins(:group).group('groups.name').sum('minutes')
  end
end
