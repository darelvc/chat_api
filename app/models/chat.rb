class Chat < ActiveRecord::Base
  has_and_belongs_to_many :users

  has_many :posts

  has_many :messages

  has_many :pings

  validates :users, length: { minimum: 2, message: 'Cannot be 1 user' }

  class << self
    def build current_user, params
      params[:user_ids] = params[:user_ids]&.push(current_user.id)

      Chat.new params
    end
  end
end
