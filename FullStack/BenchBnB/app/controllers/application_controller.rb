class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user = User.find_by(session_token: session[:session_token])
    return @current_user
  end

  def login!(user)
    session[:session_token] = user.reset_session_token!
    @current_user = user
  end

  def logout!
    session[:session_token] = nil
    @current_user = nil
  end

  def logged_in?
    !current_user.nil?
  end

  def logged_out?
    current_user.nil?
  end  

end
