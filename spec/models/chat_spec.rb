require 'rails_helper'

RSpec.describe Chat, type: :model do
  it { should have_and_belong_to_many :users }

  it { should have_many :messages }

  it { should have_many :posts }

  it { should have_many :pings }

  it { should have_many :pictures }

  context '#validate_users_count' do
    let(:chat) { stub_model Chat }

    before { expect(chat).to receive(:users).and_return([:users]).twice }

    subject { chat.errors.messages }

    before { chat.valid? }

    its([:users]) { should eq ['Cannot be 1 user'] }
  end

  describe '.build' do
    let(:user) { stub_model User, id: 3 }

    before { expect(Chat).to receive(:new).with(name: 'test', email: 'darelvc@gmail.com', user_ids: [1, 2, 3]) }

    it { expect { Chat.build user, name: 'test', email: 'darelvc@gmail.com', user_ids: [1, 2] }.to_not raise_error }
  end
end
