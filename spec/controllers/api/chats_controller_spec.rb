require 'rails_helper'

describe Api::ChatsController do
  it { should be_a Api::BaseController }

  it { should route(:get, '/api/chats').to(action: :index) }

  it { should route(:get, '/api/chats/1').to(action: :show, id: 1) }

  it { should route(:post, '/api/chats').to(action: :create) }

  it { should route(:put, '/api/chats/1').to(action: :update, id: 1) }

  let(:current_user) { double }

  before { sign_in current_user }

  describe '#index.json' do
    before { expect(subject.current_ability).to receive(:can?).with(:index, Chat).and_return(true) }

    before { get :index, format: :json }

    it { should render_template :index }
  end

  describe '#show.json' do
    let(:chat) { double }

    before { subject.instance_variable_set :@chat, chat }

    before { expect(subject.current_ability).to receive(:can?).with(:show, chat).and_return(true) }

    before { get :show, id: 1, format: :json }

    it { should render_template :show }
  end

  describe '#create.json' do
    let(:params) do
      { name: 'Test chat', description: 'Test this perfect chat' }
    end

    let(:chats) { double }

    let(:chat) { double }

    before { expect(subject.current_ability).to receive(:can?).with(:create, Chat).and_return(true) }

    before do
      #
      # current_user.chats.build params => chat
      #
      expect(current_user).to receive(:chats) do
        double.tap do |a|
          expect(a).to receive(:build).with(params).and_return(chat)
        end
      end
    end

    before { expect(chat).to receive(:save!) }

    before { post :create, id: 1, chat: params, format: :json }

    it { should render_template :create }
  end

  describe '#update.json' do
    let(:params) do
      { name: 'Test chat edited', description: 'Edited test this perfect chat' }
    end

    let(:chat) { double }

    before { subject.instance_variable_set :@chat, chat }

    before { expect(subject.current_ability).to receive(:can?).with(:update, chat).and_return(true) }

    before { expect(chat).to receive(:update!).with(params) }

    before { post :update, id: 53, chat: params, format: :json }

    it { should render_template :update }
  end

  describe '#collection' do
    before { expect(current_user).to receive(:chats).and_return(:chats) }

    its(:collection) { should eq :chats }
  end

  describe '#resource' do
    before { expect(subject).to receive(:params).and_return(id: '1') }

    before { expect(Chat).to receive(:find).with('1').and_return(:chat) }

    its(:resource) { should eq :chat }
  end
end

