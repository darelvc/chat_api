class Vote < ActiveRecord::Base
  enum kind: [:like, :dislike]

  belongs_to :user

  belongs_to :votable, polymorphic: true

  validates :user_id, uniqueness: { scope: [:votable_id, :votable_type] }
end
