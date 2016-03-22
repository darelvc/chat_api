class PostObserver < ActiveRecord::Observer
  def after_create post
    PostMailer.email(post).deliver_later
  end
end
