require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to :chat }

  it { should have_many :votes }
end
