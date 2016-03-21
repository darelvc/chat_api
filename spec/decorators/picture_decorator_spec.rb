require 'rails_helper'

describe PictureDecorator do
  let(:picture) { stub_model Picture, id: 25 }

  subject { picture.decorate }

  before do
    #
    # picture.avatar.url(:original) -> 'http://test.host/original.jpeg'
    #
    expect(picture).to receive(:avatar) do
      double.tap do |a|
        expect(a).to receive(:url).with(:original).and_return('http://test.host/original.jpeg')
      end
    end
  end

  before { expect(subject).to receive(:user).and_return(:user) }

  before { expect(subject).to receive(:chat).and_return(:chat) }

  its('as_json.symbolize_keys') do
    should eq \
      id: 25,
      avatar: 'http://test.host/original.jpeg',
      user: :user,
      chat: :chat
  end
end
