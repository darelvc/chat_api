class Message < Post
  validates :body, presence: true

  belongs_to :user, counter_cache: true
end
