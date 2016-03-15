class User < ActiveRecord::Base
  has_secure_password

  has_one :auth_token, dependent: :destroy

  has_and_belongs_to_many :chats

  has_many :messages, dependent: :destroy

  has_many :pings, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
