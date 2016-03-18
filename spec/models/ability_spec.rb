require 'rails_helper'

RSpec.describe Ability do
  subject(:ability) { Ability.new(user) }

  let(:user) { stub_model User }

  let(:another_room) { stub_model(Chat) }

  let(:chat) { stub_model Chat, users: [user] }

  let(:ping) { stub_model Ping, chat: chat }

  let(:picture) { stub_model Picture, chat: chat }

  let(:message) { stub_model Message, chat: chat }

  it { should be_able_to :read, stub_model(Chat, users: [user]) }

  it { should be_able_to :update, stub_model(Chat, users: [user]) }

  it { should_not be_able_to :manage, stub_model(Chat) }

  it { should be_able_to :manage, message }

  it { should be_able_to :manage, ping }

  it { should be_able_to :manage, picture }

  it { should_not be_able_to :manage, stub_model(Picture, chat: another_room) }

  it { should_not be_able_to :manage, stub_model(Message, chat: another_room) }

  it { should_not be_able_to :manage, stub_model(Ping, chat: another_room) }
end
