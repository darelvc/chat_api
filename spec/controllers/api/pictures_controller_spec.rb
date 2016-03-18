require 'rails_helper'

describe Api::PicturesController do
  it { should be_a Api::BaseController }

  it { should route(:get, '/api/chats/1/pictures').to(action: :index, chat_id: 1) }

  it { should route(:post, '/api/chats/1/pictures').to(action: :create, chat_id: 1) }

  before { sign_in }

  let(:picture) { double }

  let(:pictures) { double }

  describe '#index.json' do
    before { expect(Chat).to receive(:find).with('1').and_return(chat) }

    before { expect(subject.current_ability).to receive(:can?).with(:show, chat).and_return(true) }

    before { expect(subject.current_ability).to receive(:can?).with(:index, chat => Picture).and_return(true) }

    before { expect(chat).to receive(:pictures).and_return(pictures) }

    before { get :index, chat_id: 1, format: :json }

    it { should render_template :index }
  end
end
