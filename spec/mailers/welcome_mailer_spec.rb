require "rails_helper"

RSpec.describe WelcomeMailer, type: :mailer do
  it { should be_a ApplicationMailer }

  subject { WelcomeMailer.send :new }

  describe '#email' do
    let(:user) { stub_model User, email: '1@gmail.com' }

    before { expect(subject).to receive(:mail).with(to: '1@gmail.com', subject: 'Welcome!') }

    it { expect { subject.email user }.to_not raise_error }
  end
end

