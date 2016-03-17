require 'rails_helper'

describe Api::AvatarsController do
  it { should be_a Api::BaseController }

  it { should route(:patch, '/api/profile/avatar').to(action: :update) }

  before { sign_in }

  describe '#update.json' do
    let(:params) do
      {
        avatar: '/home/darelvc/rails_app/chat_api/app/assets/images/avatar.jpg',
      }
    end

    before { expect(subject.current_user).to receive(:update!).with(params) }

    before { put :update, profile: params, format: :json }

    it { should render_template :update }
  end
end
