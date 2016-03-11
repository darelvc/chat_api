require 'spec_helper'

describe ChatDecorator do
  describe '#as_json' do
    let(:chat) { stub_model Chat, id: 1, name: 'Test chat', description: 'Old test chat' }

    subject { chat.decorate.as_json }

    its([:id]) { should eq 1 }

    its([:name]) { should eq 'Test chat' }

    its([:description]) { should eq 'Old test chat' }
  end
end
