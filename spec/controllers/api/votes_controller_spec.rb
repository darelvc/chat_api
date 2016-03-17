require 'rails_helper'

describe Api::VotesController do
  it { should be_a Api::BaseController }

  it { should route(:post, '/api/messages/1/vote').to(action: :create, message_id: 1) }

  it { should route(:post, '/api/pings/1/vote').to(action: :create, ping_id: 1) }

  before { sign_in }

  describe '#create.json' do
    let(:votes) { double }

    let(:message) { stub_model Message, id: 45, type: 'Message' }

    let(:ping) { stub_model Ping, id: 53, type: 'Ping' }

    let(:vote) { double }

    let(:params) do
      { kind: 'like', user: subject.current_user }
    end

    context do
      before { expect(Message).to receive(:find).with('45').and_return(message) }

      before { expect(Vote).to receive(:find_or_initialize_by).with(votable_id: message.id, votable_type: message.type, user: subject.current_user).and_return(vote) }

      before { expect(vote).to receive(:kind=).with('like').and_return true }

      before { expect(vote).to receive(:save!) }

      before { post :create, message_id: 45, kind: 'like', format: :json }

      it { should render_template :create }
    end

    context do
      before { expect(Ping).to receive(:find).with('53').and_return(ping) }

      before { expect(Vote).to receive(:find_or_initialize_by).with(votable_id: ping.id, votable_type: ping.type, user: subject.current_user).and_return(vote) }

      before { expect(vote).to receive(:kind=).with('like').and_return true }

      before { expect(vote).to receive(:save!) }

      before { post :create, ping_id: 53, kind: 'like', format: :json }

      it { should render_template :create }
    end
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
  end
end
