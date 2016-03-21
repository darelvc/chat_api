require 'rails_helper'

RSpec.describe Recipients, type: :lib do
	let(:post) { double chat_id: 32, user_id: 24 }

  subject { Recipients.new post }

	describe '#emails' do
		let(:first) { double }

		before { expect(User).to receive(:joins).with(:chats).and_return(first) }

		let(:second) { double }

		before do
			#
			# first.where.not(users: { id: 24 }) -> second
			#
			expect(first).to receive(:where) do
				double.tap do |a|
					expect(a).to receive(:not).with(users: { id: 24 }).and_return(second)
				end
			end
		end

		let(:third) { double }

		before { expect(second).to receive(:where).with(chats: { id: 32 }).and_return(third) }

		before { expect(third).to receive(:pluck).with(:email).and_return(['one@mlsdev.com']) }

		its(:emails) { should eq %w(one@mlsdev.com) }
	end
end