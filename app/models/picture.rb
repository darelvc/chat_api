class Picture < Post
  validates :user, presence: true

  belongs_to :user

  has_many :votes, as: :votable, dependent: :destroy

  has_attached_file :avatar,
    styles: { thumbnail: 'x100' },
    convert_options: { all: '-quality 85 -strip' }

  validates :avatar,
    attachment_content_type: { content_type: /\Aimage\/png\Z|\Aimage\/jpe?g\Z/ },
    attachment_file_name: { matches: [/png\Z/, /jpe?g\Z/] }
end
