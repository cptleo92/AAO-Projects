class UsersController < ApplicationController
  before_action :require_current_user!, except: [:create, :new]
  before_action :wrong_user, only: :show

  def new
    @user = User.new
    if current_user
      redirect_to cats_url
    else
      render :new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      redirect_to new_user_url
    end
  end

  def wrong_user
    user = User.find(params[:id])
    unless current_user == user
      redirect_to cats_url
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end