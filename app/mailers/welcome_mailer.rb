class WelcomeMailer < ApplicationMailer
  def email user
    @user = user

    mail to: user.email, subject: 'Welcome!'
  end
end
