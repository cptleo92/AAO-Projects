class UserMailer < ApplicationMailer
  default from: 'notif@musicapp.com'

  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: 'Welcome to Music App!')
  end

  def activation_email(user)
    @user = user
    mail(to: user.email, subject: 'Activate your account!')
  end
end
