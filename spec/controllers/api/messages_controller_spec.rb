require 'rails_helper'

describe Api::MessagesController do
  it { should be_a Api::BaseController }

  it { should route(:get, '/api/chats/1/messages').to(action: :index, chat_id: 1) }

  it { should route(:get, '/api/chats/1/messages/1').to(action: :show, chat_id: 1, id: 1) }

  it { should route(:post, '/api/chats/1/messages').to(action: :create, chat_id: 1) }

  let(:current_user) { double }

  before { sign_in current_user }

  describe '#index.json' do
    before { get :index, chat_id: 1, format: :json }

    it { should render_template :index }
  end

  describe '#show.json' do
    let(:message) { double }

    before { subject.instance_variable_set :@message, message }

    before { get :show, chat_id: 1, id: 1, format: :json }

    it { should render_template :show }
  end

  describe '#create.json' do
    let(:params) do
      { body: 'Example text message', user: current_user }
    end

    let(:message) { double }

    let(:chat) { double }

    let(:messages) { double }

    before { expect(Chat).to receive(:find).with('1').and_return(chat) }

    before { expect(chat).to receive(:messages).and_return messages }

    before { expect(messages).to receive(:new).with(params).and_return message }

    before { expect(message).to receive(:save!).and_return true }

    before { post :create, chat_id: 1, message: params, format: :json }

    it { should render_template :create }
  end
end
