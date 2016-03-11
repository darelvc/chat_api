class Chat < ActiveRecord::Base
  has_and_belongs_to_many :users

  has_many :messages

  class << self
    def build current_user, params
      params[:user_ids]= params[:user_ids].push(current_user.id)

      Chat.new params
    end
  end

  # validate :validate_users_count

  # def validate_users_count
  #   errors.add(:chat, 'You cannot create chat less than 2 users') if user_ids.count < 2
  # end
end
