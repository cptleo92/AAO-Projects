class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user && logged_out?
      login!(@user)
      redirect_to api_user_url(@user)
    else
      render json: ["Invalid username or password"], status: 401
    end
  end

  def destroy
    if logged_in?
      logout!
      render json: {}
    else
      render json: ["Already logged out"], status: 401
    end
  end
end