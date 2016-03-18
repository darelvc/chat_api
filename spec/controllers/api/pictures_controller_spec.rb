require 'rails_helper'

describe Api::PicturesController do
  it { should be_a Api::BaseController }

  it { should route(:get, '/api/chats/1/pictures').to(action: :index, chat_id: 1) }

  it { should route(:post, '/api/chats/1/pictures').to(action: :create, chat_id: 1) }

  before { sign_in }

  let(:picture) { double }

  let(:pictures) { double }

  let(:chat) { double }

  describe '#index.json' do
    before { expect(Chat).to receive(:find).with('1').and_return(chat) }

    before { expect(subject.current_ability).to receive(:can?).with(:show, chat).and_return(true) }

    before { expect(subject.current_ability).to receive(:can?).with(:index, chat => Picture).and_return(true) }

    before { expect(chat).to receive(:pictures).and_return(pictures) }

    before { get :index, chat_id: 1, format: :json }

    it { should render_template :index }
  end

  describe '#create.json' do
    let(:params) do
      { avatar: '/system/pictures/avatars/000/000/003/original/avatar.jpg', user: subject.current_user }
    end

    before { expect(Chat).to receive(:find).with('7').and_return(chat) }

    before { expect(subject.current_ability).to receive(:can?).with(:show, chat).and_return(true) }

    before { expect(subject.current_ability).to receive(:can?).with(:create, chat => Picture).and_return(true) }

    before { expect(chat).to receive(:pictures).and_return(pictures) }

    before { expect(pictures).to receive(:new).with(params).and_return(picture) }

    before { expect(picture).to receive(:save!).and_return true }

    before { post :create, chat_id: 7, picture: params, format: :json }

    it { should render_template :create }
  end

  describe '#collection' do
    before { expect(subject).to receive(:parent).and_return(chat) }

    before { expect(chat).to receive(:pictures).and_return pictures }

    its(:collection) { should eq pictures }
  end

  describe '#parent' do
    before { subject.instance_variable_set :@chat, :chat }

    its(:parent) { should eq :chat }
  end

  describe '#resource' do
    before { subject.instance_variable_set :@picture, :picture }

    its(:resource) { should eq :picture }
  end
end
