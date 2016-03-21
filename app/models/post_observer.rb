class PostObserver < ActiveRecord::Observer
  def after_create post
    PostMailer.new_post(post.chat, post.user).deliver_now
  end
end
