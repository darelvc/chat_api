class Vote < ActiveRecord::Base
  enum kind: [:like, :dislike]

  belongs_to :user

  belongs_to :votable, polymorphic: true

  validates :user, uniqueness: { scope: [:votable, :votable_type], message: 'Has already voted' }
end
