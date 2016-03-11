class Message < ActiveRecord::Base
  belongs_to :chat

  belongs_to :user, counter_cache: true

  #validates :body, :user, :chat, presence: true
end
