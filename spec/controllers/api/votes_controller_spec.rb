require 'rails_helper'

describe Api::VotesController do
  it { should be_a Api::BaseController }

  it { should route(:post, '/api/messages/1/vote').to(action: :create, message_id: 1) }

  it { should route(:post, '/api/pings/1/vote').to(action: :create, ping_id: 1) }

  before { sign_in }

  describe '#create.json' do
    let(:votes) { double }

    let(:message) { double }

    let(:ping) { double }

    let(:vote) { double }

    let(:params) do
      { kind: 'like', user: subject.current_user }
    end

    context do
      before { expect(Message).to receive(:find).with('28').and_return(message) }

      before { expect(message).to receive(:votes).and_return(votes) }

      before { expect(votes).to receive(:build).with(params).and_return(vote) }

      before { expect(vote).to receive(:save!) }

      before { post :create, message_id: 28, vote: params, format: :json }

      it { should render_template :create }
    end

    context do
      before { expect(Ping).to receive(:find).with('51').and_return(ping) }

      before { expect(ping).to receive(:votes).and_return(votes) }

      before { expect(votes).to receive(:build).with(params).and_return(vote) }

      before { expect(vote).to receive(:save!) }

      before { post :create, ping_id: 51, vote: params, format: :json }

      it { should render_template :create }
    end
  end

  describe '#update.json' do

  end

  describe '#parent' do
    context do
      before { expect(subject).to receive(:params).and_return(message_id: 19).twice }

      before { expect(Message).to receive(:find).with(19) }

      it { expect { subject.send :parent }.to_not raise_error }
    end

    context do
      before { expect(subject).to receive(:params).and_return(ping_id: 26).at_least(3) }

      before { expect(Ping).to receive(:find).with(26) }

      it { expect { subject.send :parent }.to_not raise_error }
    end

    context do
      it { expect { subject.send :parent }.to raise_error(ActiveRecord::RecordNotFound) }
    end
  end
end
