require 'rails_helper'

RSpec.describe Vote, type: :model do
  it do
    should define_enum_for(:kind).
      with([:like, :dislike])
  end

  it { should belong_to :user }

  it { should belong_to(:votable) }

  #it { should validate_uniqueness_of(:user_id).scoped_to(:votable_id, :votable_type) }
end
