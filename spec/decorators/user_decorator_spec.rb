require 'rails_helper'

describe UserDecorator do
  describe '#as_json' do
    let(:user) { stub_model User, name: 'Oleg', email: 'oleg@hostpro.ua' }

    subject { user.decorate.as_json }

    its([:name]) { should eq 'Oleg' }

    its([:email]) { should eq 'oleg@hostpro.ua' }
  end
end
