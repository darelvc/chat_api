require 'rails_helper'

RSpec.describe PostObserver, type: :observer do
  describe '#after_create' do
    let(:post) { stub_model(Post, valid?: true).as_new_record  }

    #let(:user) { stub_model User }

    before do
      #
      # PostMailer.new_post(post).deliver_now
      #
      expect(PostMailer).to receive(:new_post).with(post) do
        double.tap do |a|
          expect(a).to receive(:deliver_now)
        end
      end
    end

    it do
      ActiveRecord::Base.observers.enable :post_observer do
        expect { post.save }.to_not raise_error
      end
    end
  end
end
