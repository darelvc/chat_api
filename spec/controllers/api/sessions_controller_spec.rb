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

  describe '#destroy.json' do
    let(:user) { stub_model User }

    let(:session) { double }

    before { sign_in user }

    before { expect(Session).to receive(:new).with(user: user).and_return session }

    before { expect(session).to receive(:destroy!) }

    before { delete :destroy, format: :json }

    it { should respond_with :ok }
  end
end
