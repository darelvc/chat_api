class PostMailer < ApplicationMailer
  def email post
  	@post = post

  	mail to: Recipients.new(post).emails, subject: 'New Message'
  end
end
