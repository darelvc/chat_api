class Post < ActiveRecord::Base
  belongs_to :chat

  belongs_to :user, counter_cache: true
end
