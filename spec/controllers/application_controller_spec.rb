require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe '#json_request?' do
    before do
      #
      # subject.request.format.json? -> true
      #
      expect(subject).to receive(:request) do
        double.tap do |a|
          expect(a).to receive(:format) do
            double.tap do |b|
              expect(b).to receive(:json?).and_return(true)
            end
          end
        end
      end
    end

    its(:json_request?) { should eq true }
  end
end
