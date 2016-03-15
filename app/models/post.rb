class Post < ActiveRecord::Base
  belongs_to :chat

  has_many :votes, as: :votable, dependent: :destroy
end
