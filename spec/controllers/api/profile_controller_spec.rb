require 'rails_helper'

describe Api::ProfilesController do
  it { should be_a Api::BaseController }

  it { should route(:get, '/api/profile').to(action: :show) }

  it { should route(:patch, '/api/profile').to(action: :update) }

  before { sign_in }

  describe '#update.json' do
    let(:params) do
      {
        name: 'Test name',
        password: '12345678',
        password_confirmation: '12345678'
      }
    end

    before { expect(subject.current_user).to receive(:update!).with(params) }

    before { put :update, profile: params, format: :json }

    it { should render_template :update }
  end

  describe '#show.json' do
    before { get :show, id: 1, format: :json }

    it { should render_template :show }
  end
end
