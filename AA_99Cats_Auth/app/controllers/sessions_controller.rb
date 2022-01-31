class SessionsController < ApplicationController
  before_action :require_logged_out!, except: [:destroy]

  def new
    render :new
  end

  def create    
    user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    if user.nil?
      render json: 'Wrong login'
    else
      # session[:session_token] = user.reset_session_token!
      # redirect_to cats_url
      login!(user)
      redirect_to user_url(user)
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

end