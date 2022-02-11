class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def logged_in?
    !current_user.nil?
  end

  def logged_out?
    current_user.nil?
  end

  def current_user
    return nil if session[:session_token].nil?
    @current_user = User.find_by(session_token: session[:session_token])
  end

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    current_user.session_token = nil
    session[:session_token] = nil
  end

  private
  def require_logged_in
    redirect_to new_sessions_url unless logged_in?
  end

  def require_logged_out
    redirect_to user_url(current_user) unless logged_out?
  end

end
