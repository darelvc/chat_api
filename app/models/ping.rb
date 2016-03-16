class Ping < Post
  validates :user, presence: true

  belongs_to :user

  has_many :votes, as: :votable, dependent: :destroy
end
