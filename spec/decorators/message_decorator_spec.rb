require 'rails_helper'

describe MessageDecorator do
  describe '#as_json' do
    let(:message) { stub_model Message, body: 'Olegs chat', user_id: 1 }

    subject { message.decorate.as_json }

    its([:body]) { should eq 'Olegs chat' }

    its([:user_id]) { should eq 1 }
  end
end
