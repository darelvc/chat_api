require 'rails_helper'

describe Api::PingsController do
  it { should be_a Api::BaseController }

  it { should route(:get, '/api/chats/1/pings').to(action: :index, chat_id: 1) }

  it { should route(:post, '/api/chats/1/pings').to(action: :create, chat_id: 1) }

  before { sign_in }

  let(:chat) { double }

  let(:pings) { double }

  let(:ping) { double }

  describe '#index.json' do
    before { expect(Chat).to receive(:find).with('1').and_return(chat) }

    before { expect(subject.current_ability).to receive(:can?).with(:show, chat).and_return(true) }

    before { expect(subject.current_ability).to receive(:can?).with(:index, chat => Ping).and_return(true) }

    before { expect(chat).to receive(:pings).and_return(pings) }

    before { get :index, chat_id: 1, format: :json }

    it { should render_template :index }
  end

  describe '#create.json' do
    let(:params) do
      { user: subject.current_user }
    end

    before { expect(Chat).to receive(:find).with('1').and_return(chat) }

    before { expect(subject.current_ability).to receive(:can?).with(:show, chat).and_return(true) }

    before { expect(subject.current_ability).to receive(:can?).with(:create, ping).and_return(true) }

    before { expect(chat).to receive(:pings).and_return(pings).twice }

    before { expect(pings).to receive(:new).with(user: subject.current_user).and_return(ping).twice }

    before { expect(ping).to receive(:save!).and_return true }

    before { post :create, chat_id: 1, ping: params, format: :json }

    it { should render_template :create }
  end

  describe '#collection' do
    before { expect(subject).to receive(:parent).and_return(chat) }

    before { expect(chat).to receive(:pings).and_return pings }

    its(:collection) { should eq pings }
  end

  describe '#parent' do
    before { subject.instance_variable_set :@chat, :chat }

    its(:parent) { should eq :chat }
  end

  describe '#resource' do
    before { subject.instance_variable_set :@ping, :ping }

    its(:resource) { should eq :ping }
  end
end
