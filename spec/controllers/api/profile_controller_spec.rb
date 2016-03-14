require 'rails_helper'

describe Api::ProfilesController do
  it { should be_a Api::BaseController }

  it { should route(:get, '/api/profile').to(action: :show) }

  it { should route(:patch, '/api/profile').to(action: :update) }

  describe '#show.json' do

  end

  describe '#update.json' do

  end
end
