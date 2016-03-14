class User < ActiveRecord::Base
  has_secure_password

  has_one :auth_token, dependent: :destroy

  has_and_belongs_to_many :chats

  has_many :posts

  has_many :messages

  has_many :pings

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
