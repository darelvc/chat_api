require 'rails_helper'

describe UserDecorator do
  describe '#as_json' do
    let(:user) { stub_model User, id: 1, name: 'Oleg', email: 'oleg@hostpro.ua', messages_count: 1 }

    subject { user.decorate.as_json }

    its([:name]) { should eq 'Oleg' }

    its([:email]) { should eq 'oleg@hostpro.ua' }

    its([:messages_count]) { should eq 1 }

    context do
      before { expect(user).to receive(:avatar).with(:thumbnail).and_return('/thumbnail.jpeg') }

      its([:avatar]) { should eq 'http://test.host/thumbnail.jpeg' }
    end
  end
end
