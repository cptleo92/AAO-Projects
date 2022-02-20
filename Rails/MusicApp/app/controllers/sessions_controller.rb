class SessionsController < ApplicationController
  def new
    if logged_in? 
      redirect_to user_url(current_user)
    else
      render :new
    end
  end

  def create
    user = User.find_by_credentials(params[:users][:email], params[:users][:password])
    if user.nil?
      flash.now[:errors] = "Wrong credentials"
      render :new
    elsif user.activated
      login!(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = "Please activate your account!"
      msg = UserMailer.activation_email(user)
      msg.deliver
      render :new
    end
  end

  def destroy   
    logout!
    redirect_to new_user_url
  end
  
  private
  def user_params
    params.require(:users).permit(:email, :password)
  end
end