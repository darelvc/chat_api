require 'rails_helper'

RSpec.describe Api::BaseController, type: :controller do
  describe '#authenticate' do
    before { expect(subject).to receive(:authenticate_or_request_with_http_token).and_yield('token', nil) }

    before do
      #
      # User.joins(:auth_token).find_by(auth_tokens: { value: 'token' })
      #
      expect(User).to receive(:joins).with(:auth_token) do
        double.tap do |a|
          expect(a).to receive(:find_by).with(auth_tokens: { value: 'token' })
        end
      end
    end

    it { expect { subject.send :authenticate }.to_not raise_error }
  end
end

