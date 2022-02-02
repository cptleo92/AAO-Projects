class UsersController < ApplicationController
  def new
    if logged_in? 
      redirect_to user_url(current_user)
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      welcome = UserMailer.welcome_email(@user)
      welcome.deliver
      redirect_to bands_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def activate
    @user = User.find_by(activation_token: params[:activation_token])
    @user.toggle!(:activated)
    login!(@user)
    redirect_to user_url(@user)
  end

  private
  def user_params
    params.require(:users).permit(:email, :password)
  end
end