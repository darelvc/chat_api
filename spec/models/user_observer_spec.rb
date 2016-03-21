require 'rails_helper'

RSpec.describe UserObserver, type: :observer do
  describe '#after_create' do
    subject { stub_model(User, valid?: true).as_new_record }

    before do
      #
      # WelcomeMailer.email(subject).deliver_now
      #
      expect(WelcomeMailer).to receive(:email).with(subject) do
        double.tap do |a|
          expect(a).to receive(:deliver_now)
        end
      end
    end

    it do
      ActiveRecord::Base.observers.enable :user_observer do
        expect { subject.save }.to_not raise_error
      end
    end
  end
end
