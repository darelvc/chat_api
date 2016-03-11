class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, Chat do |chat|
      chat.user_ids.include? user.id
    end

    can :manage, Message do |message|
      message.chat.users.find_by(id: user.id)
    end
  end
end
