class Message < ActiveRecord::Base
  belongs_to :chat

  belongs_to :user

  #validates :body, :user, :chat, presence: true
end
