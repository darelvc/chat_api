class PostMailer < ApplicationMailer
  def new_post post
  	@post = post

  	mail to: Recipients.new(post).emails, subject: 'New Message' 
  end
end
