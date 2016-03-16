class Message < Post
  validates :body, presence: true

  belongs_to :user, counter_cache: true

  has_many :votes, as: :votable, dependent: :destroy
end
