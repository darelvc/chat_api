require 'rails_helper'

describe Api::ChatsController do

  it { should route(:get, '/api/chats').to(action: :index) }

  it { should route(:get, '/api/chats/1').to(action: :show, id: 1) }

end
