require 'rails_helper'

describe PingDecorator do
  describe '#as_json' do
    let(:ping) { stub_model Ping, id: 1, body: 'Olegs pings', user_id: 1 }

    subject { ping.decorate.as_json }

    its([:id]) { should eq 1 }

    its([:body]) { should eq 'Olegs pings' }

    its([:user_id]) { should eq 1 }
  end
end
