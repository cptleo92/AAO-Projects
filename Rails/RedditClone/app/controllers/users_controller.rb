class UsersController < ApplicationController
  before_action :require_logged_out, only: [:new, :create] 

  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
      redirect_to subs_url
    else
      render :show
    end
  end

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to user_url(@user.id)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end