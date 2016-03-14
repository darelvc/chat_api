require 'rails_helper'

describe ChatDecorator do
  describe '#as_json' do
    let(:chat) { stub_model Chat, id: 1, name: 'Test chat', description: 'Old test chat' }

    subject { chat.decorate.as_json }

    its([:id]) { should eq 1 }

    its([:name]) { should eq 'Test chat' }

    its([:description]) { should eq 'Old test chat' }

    context do
      let(:decorated) { chat.decorate }

      before { expect(decorated).to receive(:users).and_return(:users) }

      subject { decorated.as_json }

      its([:users]) { should eq :users }
    end

    context do
      subject { chat.decorate.as_json short: true }

      its([:users]) { should be_nil }
    end
  end
end
