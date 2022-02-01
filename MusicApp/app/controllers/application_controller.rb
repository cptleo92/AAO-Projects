class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    session[:session_token] != nil
  end
  
  def require_logged_in!
    unless logged_in?
      redirect_to bands_url
    end
  end

  def login!(user)
    @current_user = user
    session[:session_token] = user.session_token   
  end

  def logout!
    current_user.try(:reset_session_token!)
    session[:session_token] = nil
  end

end
