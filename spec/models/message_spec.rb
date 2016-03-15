require 'rails_helper'

RSpec.describe Message, type: :model do
  it { should validate_presence_of :body }

  it { should belong_to(:user).counter_cache(true) }
end
