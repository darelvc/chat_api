class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can [:read, :update], Chat do |chat|
      chat.user_ids.include?(user.id)
    end

    can :manage, Message do |message|
      message.chat.user_ids.include?(user.id)
    end

    can :manage, Ping do |ping|
      ping.chat.user_ids.include?(user.id)
    end

    can :manage, Picture do |picture|
      picture.chat.user_ids.include?(user.id)
    end
  end
end
