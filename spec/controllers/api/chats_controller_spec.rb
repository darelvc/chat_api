require 'rails_helper'

describe Api::ChatsController do

  it { should route(:get, '/api/chats').to(action: :index) }

  it { should route(:get, '/api/chats/1').to(action: :show, id: 1) }

  describe '#index.json' do

    before { get :index, format: :json }

    it { should render_template :index }

  end

  describe '#show.json' do

    before { get :show, id: 1, format: :json }

    it { should render_template :show }

  end

end
