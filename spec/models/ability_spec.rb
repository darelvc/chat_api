require 'rails_helper'

RSpec.describe Ability do
  subject(:ability) { Ability.new(user) }

  let(:user) { stub_model User }

  context do
    let(:chat) { stub_model Chat, users: [user] }

    it { should be_able_to :read, stub_model(Chat, users: [user]) }

    it { should be_able_to :update, stub_model(Chat, users: [user]) }
  end

  context do
    let(:chat) { stub_model Chat, users: [user] }

    let(:ping) { stub_model Ping, chat: chat }

    it { should be_able_to :manage, ping }
  end

  context do
    let(:chat) { stub_model Chat, users: [user] }

    let(:picture) { stub_model Picture, chat: chat }

    it { should be_able_to :manage, picture }
  end

  context do
    let(:chat) { stub_model Chat, users: [user] }

    let(:message) { stub_model Message, chat: chat }

    it { should be_able_to :manage, message }
  end

  context do
    it { should_not be_able_to :manage, stub_model(Chat) }
  end

  context do
    let(:another_room) { stub_model(Chat) }

    it { should_not be_able_to :manage, stub_model(Picture, chat: another_room) }
  end

  context do
    let(:another_room) { stub_model(Chat) }

    it { should_not be_able_to :manage, stub_model(Message, chat: another_room) }
  end

  context do
    let(:another_room) { stub_model(Chat) }

    it { should_not be_able_to :manage, stub_model(Ping, chat: another_room) }
  end
end
