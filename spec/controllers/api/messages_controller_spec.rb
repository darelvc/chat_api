require 'rails_helper'

describe Api::MessagesController do
  it { should be_a Api::BaseController }

  it { should route(:get, '/api/chats/1/messages').to(action: :index, chat_id: 1) }

  it { should route(:post, '/api/chats/1/messages').to(action: :create, chat_id: 1) }

  before { sign_in }

  let(:chat) { double }

  let(:messages) { double }

  let(:message) { double }

  describe '#index.json' do
    before { expect(Chat).to receive(:find).with('1').and_return(chat) }

    before { expect(subject.current_ability).to receive(:can?).with(:show, chat).and_return(true) }

    before { expect(subject.current_ability).to receive(:can?).with(:index, chat => Message).and_return(true) }

    before { expect(chat).to receive(:messages).and_return(messages) }

    before { get :index, chat_id: 1, format: :json }

    it { should render_template :index }
  end

  describe '#create.json' do
    let(:params) do
      { body: 'Example text message', user: subject.current_user }
    end

    before { expect(Chat).to receive(:find).with('1').and_return(chat) }

    before { expect(subject.current_ability).to receive(:can?).with(:show, chat).and_return(true) }

    before { expect(subject.current_ability).to receive(:can?).with(:create, message).and_return(true) }

    before { expect(chat).to receive(:messages).and_return(messages) }

    before { expect(messages).to receive(:new).with(params).and_return message }

    before { expect(message).to receive(:save!).and_return true }

    before { post :create, chat_id: 1, message: params, format: :json }

    it { should render_template :create }
  end

  describe '#collection' do
    before { expect(subject).to receive(:parent).and_return(chat) }

    before { expect(chat).to receive(:messages).and_return messages }

    its(:collection) { should eq messages }
  end

  describe '#parent' do
    before { subject.instance_variable_set :@chat, :chat }

    its(:parent) { should eq :chat }
  end

  describe '#resource' do
    before { subject.instance_variable_set :@message, :message }

    its(:resource) { should eq :message }
  end
end
