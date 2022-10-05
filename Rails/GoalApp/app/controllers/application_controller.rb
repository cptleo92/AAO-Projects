class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    current_user ? true : false
  end

  def require_logged_in
    unless logged_in?
      redirect_to new_sessions_url
    end
  end

  def require_correct_user
    goal = Goal.find_by(id: params[:id])
    unless current_user == goal.user
      redirect_to root_url
    end
  end

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!(user)
    user.session_token = nil
    session[:session_token] = nil    
  end

end
