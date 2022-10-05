class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user.nil?
      flash.now[:errors] = ["Wrong credentials"]
      render :new
    else
      login!(@user)
      redirect_to user_url(@user)
    end

  end

  def destroy
    logout!(current_user)
    redirect_to new_user_url
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end