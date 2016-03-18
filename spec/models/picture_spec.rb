require 'rails_helper'

RSpec.describe Picture, type: :model do
  it { should belong_to :user }

  it { should have_many :votes }

  it { should validate_presence_of :user }

  it { should have_attached_file(:avatar) }

  it { should validate_attachment_presence(:avatar) }

  it do
   should validate_attachment_content_type(:avatar).
      allowing('image/png', 'image/jpeg', 'image/jpg').
      rejecting('image/gif', 'application/pdf')
  end

  it { should_not allow_value('multiki.pdf').for :avatar_file_name }
end
