require "rails_helper"

RSpec.describe PostMailer, type: :mailer do
	describe '#email' do
		let(:post) { double }

		before do
			#
			# Recipients.new(post).emails -> %w(one@mlsdev.com two@mlsdev.com)
			#
			expect(Recipients).to receive(:new).with(post) do
				double.tap { |a| expect(a).to receive(:emails).and_return(['one@mlsdev.com, two@mlsdev.com']) }
			end
		end

		subject { PostMailer.email post }

		its(:from) { should eq ['from@example.com'] }

		its(:to) { should eq %w(one@mlsdev.com two@mlsdev.com) }

		its(:subject) { should eq 'New Message' }
	end
end
