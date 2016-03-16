require 'rails_helper'

RSpec.describe Ping, type: :model do
  it { should validate_presence_of :user }

  it { should belong_to :user }

  it { should have_many :votes }
end
