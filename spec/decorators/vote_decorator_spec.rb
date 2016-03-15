require 'rails_helper'

describe VoteDecorator do
  describe '#as_json' do
    let(:vote) { stub_model Vote, kind: 'like' }

    subject { vote.decorate.as_json }

    its([:kind]) { should eq 'like' }
  end
end
