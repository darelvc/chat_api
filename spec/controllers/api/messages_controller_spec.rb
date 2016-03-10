require 'rails_helper'

describe Api::MessagesController do
  it { should be_a Api::BaseController }

  it { should route(:get, '/api/chats/1/messages').to(action: :index, chat_id: 1) }

  it { should route(:get, '/api/chats/1/messages/1').to(action: :show, chat_id: 1, id: 1) }

  it { should route(:post, '/api/chats/1/messages').to(action: :create, chat_id: 1) }

  let(:current_user) { double }

  before { sign_in current_user }

  let(:chat) { double }

  let(:messages) { double }

  let(:message) { double }

  describe '#index.json' do
    before { get :index, chat_id: 1, format: :json }

    it { should render_template :index }
  end

  describe '#show.json' do
    before { subject.instance_variable_set :@message, message }

    before { get :show, chat_id: 1, id: 1, format: :json }

    it { should render_template :show }
  end

  describe '#create.json' do
    let(:params) do
      { body: 'Example text message', user: current_user }
    end

    before { expect(Chat).to receive(:find).with('1').and_return(chat) }

    before { expect(chat).to receive(:messages).and_return messages }

    before { expect(messages).to receive(:new).with(params).and_return message }

    before { expect(message).to receive(:save!).and_return true }

    before { post :create, chat_id: 1, message: params, format: :json }

    it { should render_template :create }
  end

  describe '#collection' do
    before { subject.params = { chat_id: '1' } }

    before { expect(Chat).to receive(:find).with('1').and_return(chat) }

    before { expect(chat).to receive(:messages).and_return messages }

    its(:collection) { should eq messages }
  end

  describe '#resource' do
    before { subject.params = { chat_id: '31', id: '49' } }

    before do
      #
      # Chat.find('31').messages.find('49') => message
      #
      expect(Chat).to receive(:find).with('31') do
        double.tap do |a|
          expect(a).to receive(:messages) do
            double.tap do |b|
              expect(b).to receive(:find).with('49').and_return message
            end
          end
        end
      end
    end

    its(:resource) { should eq message }
  end
end
