require 'rails_helper'

describe PingDecorator do
  describe '#as_json' do
    let(:ping) { stub_model Ping, id: 1, type: 'Ping', user_id: 1 }

    subject { ping.decorate.as_json }

    its([:id]) { should eq 1 }

    its([:type]) { should eq 'Ping' }

    its([:user_id]) { should eq 1 }
  end
end
