class User < ActiveRecord::Base
  has_secure_password

  has_one :auth_token, dependent: :destroy

  has_and_belongs_to_many :chats

  has_many :messages, dependent: :destroy

  has_many :pings, dependent: :destroy

  has_many :pictures, dependent: :destroy

  validates :name, :email, presence: true, uniqueness: { case_sensitive: false }

  has_attached_file :avatar,
    styles: { thumbnail: 'x100' },
    convert_options: { all: '-quality 85 -strip' }

  validates :avatar,
    attachment_content_type: { content_type: /\Aimage\/png\Z|\Aimage\/jpe?g\Z/ },
    attachment_file_name: { matches: [/png\Z/, /jpe?g\Z/] }
end
