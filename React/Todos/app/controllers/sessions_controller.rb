class SessionsController < ApplicationController
  before_action :require_logged_out, only: [:new, :create]
  before_action :require_logged_in, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:user])
    if @user
      login!(@user)
      redirect_to root_url
    else
      @user = User.new
      flash.now[:errors] = ['Invalid username or password']
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

end