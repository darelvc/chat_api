class PostMailer < ApplicationMailer
  def new_post chat
    emails = chat.users.pluck(:email)

    mail to: emails, subject: 'New Post!'
  end
end
