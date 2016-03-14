class UserDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    {
      name: name,
      email: email,
      posts_count: posts_count
    }
  end
end
