require 'rails_helper'

RSpec.describe Api::BaseController, type: :controller do
  describe '#authenticate' do
    before { expect(subject).to receive(:authenticate_or_request_with_http_token).and_yield('token', nil) }

    before do
      #
      # User.joins(:auth_token).find_by(auth_tokens: { value: 'token' }) -> :user
      #
      expect(User).to receive(:joins).with(:auth_token) do
        double.tap do |a|
          expect(a).to receive(:find_by).with(auth_tokens: { value: 'token' }).and_return(:user)
        end
      end
    end

    its(:authenticate) { should eq :user }
  end
end

