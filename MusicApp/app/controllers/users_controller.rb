class UsersController < ApplicationController
  def new
    if logged_in? 
      redirect_to user_url(current_user)
    else
      render :new
    end
  end

  def show
    render :show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)      
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private
  def user_params
    params.require(:users).permit(:email, :password)
  end
end