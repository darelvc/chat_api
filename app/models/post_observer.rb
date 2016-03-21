class PostObserver < ActiveRecord::Observer
  def after_create post
    PostMailer.new_post(post).deliver_now
  end
end
