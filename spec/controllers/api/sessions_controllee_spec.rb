require 'rails_helper'

describe Api::SessionsController do
  it { should be_a Api::BaseController }

  it { should route(:post, '/api/session').to(action: :create) }

  it { should route(:delete, '/api/session').to(action: :destroy) }

  describe '#create.json' do
    let(:params) do
      { email: 'test@test.ru', password: 'test' }
    end

    let(:session) { double }

    before { expect(Session).to receive(:new).with(params).and_return session }

    before { expect(session).to receive(:save!) }

    before { post :create, session: params, format: :json }

    it { should render_template :create }
  end
end
