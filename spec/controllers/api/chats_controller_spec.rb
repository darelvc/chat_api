require 'rails_helper'

describe Api::ChatsController do
  it { should be_a Api::BaseController }

  it { should route(:get, '/api/chats').to(action: :index) }

  it { should route(:get, '/api/chats/1').to(action: :show, id: 1) }

  it { should route(:post, '/api/chats').to(action: :create) }

  it { should route(:put, '/api/chats/1').to(action: :update, id: 1) }

  before { allow(subject).to receive(:authenticate) }

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
end

