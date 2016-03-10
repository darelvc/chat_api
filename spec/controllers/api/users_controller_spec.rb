require 'rails_helper'

describe Api::UsersController do
  it { should be_a Api::BaseController }

  it { should route(:get, '/api/users').to(action: :index) }

  it { should route(:get, '/api/users/1').to(action: :show, id: 1) }

  it { should route(:post, '/api/users').to(action: :create) }

  before { sign_in }

  describe '#index.json' do
    before { get :index, format: :json }

    it { should render_template :index }
  end

  describe '#show.json' do
    let(:user) { double }

    before { subject.instance_variable_set :@user, user }

    before { get :show, id: 1, format: :json }

    it { should render_template :show }
  end

  describe '#create.json' do
    let(:params) do
      { name: 'Oleg Bloshenkin', email: 'darelvc@gmail.com', password: '1111' }
    end

    let(:user) { double }

    before { expect(User).to receive(:new).with(params).and_return user }

    before { expect(user).to receive(:save!) }

    before { post :create, id: 1, user: params, format: :json }

    it { should render_template :create }
  end

  describe '#collection' do
    before { expect(User).to receive(:all).and_return(:users) }

    # it { expect { subject.send :collection }.to_not raise_error }

    its(:collection) { should eq :users }
  end

  describe '#resource' do
    before { expect(subject).to receive(:params).and_return(id: '1') }

    before { expect(User).to receive(:find).with('1').and_return(:user) }

    its(:resource) { should eq :user }
  end
end
