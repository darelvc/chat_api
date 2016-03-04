class User < ActiveRecord::Base
  has_secure_password
  has_one :auth_token, dependent: :destroy
  has_many :chats
  has_many :messages
  validates :name, presence: true, uniqueness: true
  #validates :email, presence: true, uniqueness: { case_sensitive: false }, email: true
end
