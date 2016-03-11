require 'rails_helper'

RSpec.describe Ability do
  subject(:ability) { Ability.new(user) }

  let(:user) { stub_model User }

  it { should be_able_to :manage, stub_model(Chat, users: [user]) }

  it { should_not be_able_to :manage, stub_model(Chat) }
end
