require 'rails_helper'

describe PictureDecorator do
  describe '#as_json' do
    let(:picture) { stub_model Picture, id: 1, user_id: 1, type: 'Picture' }

    subject { picture.decorate.as_json }

    its([:user_id]) { should eq 1 }

    its([:id]) { should eq 1 }

    its([:type]) { should eq 'Picture' }

    context do
      let(:url) { double }

      let(:avatar) { double }

      before { expect(picture).to receive(:avatar).and_return(avatar) }

      before { expect(avatar).to receive(:url).with(:original).and_return('http://test.host/thumbnail.jpeg') }

      its([:avatar]) { should eq 'http://test.host/thumbnail.jpeg' }
    end


  end
end



