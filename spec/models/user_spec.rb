require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_secure_password }

  it { should have_many :messages }

  it { should have_and_belong_to_many :chats }

  it { should validate_presence_of :name }

  it { should validate_uniqueness_of(:name).case_insensitive }

  it { should have_one(:auth_token).dependent(:destroy) }

  it { should validate_presence_of :email }

  it { should validate_uniqueness_of(:email).case_insensitive }

  it { should allow_value('test@test.com').for(:email) }
end
