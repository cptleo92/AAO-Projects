class Api::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if @user
      render :show
    else   
      render json: @user.errors.full_messages, status: 404
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to api_user_url(@user)
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  private
  def user_params
    params.require(:user).permit(:id, :username, :email, :password)
  end

end
