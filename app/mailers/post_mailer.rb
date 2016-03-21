class PostMailer < ApplicationMailer
  def new_post chat, user
    @user = user

    @users = chat.users.where.not(id: user.id)

    emails = @users.pluck(:email)

    mail to: emails, subject: 'New Post!'
  end
end
