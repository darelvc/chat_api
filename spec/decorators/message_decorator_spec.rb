require 'rails_helper'

describe MessageDecorator do
  describe '#as_json' do
    let(:message) { stub_model Message, id: 1, body: 'Olegs chat', type: 'Message', user_id: 1 }

    subject { message.decorate.as_json.symbolize_keys }

    its([:id]) { should eq 1 }

    its([:body]) { should eq 'Olegs chat' }

    its([:type]) { should eq 'Message' }

    its([:user_id]) { should eq 1 }
  end
end
