module StaticPagesHelper
  def login_user(user)
    session[:current_user] = user.id
    current_user
  end

  def logout_user
    session.delete(:current_user)
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:current_user]) if session[:current_user]
  end

  def current_user?(user)
    user && user == current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def logged_in_user
    return if logged_in?

    flash[:danger] = 'Please log in.'
    redirect_to login_url
  end
end
