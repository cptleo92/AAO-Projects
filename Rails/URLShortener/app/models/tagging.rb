class Tagging < ApplicationRecord
  validates :url_id, :tag_id, presence: true

  def self.tag_url(url_id, tag_id)
    Tagging.create(url_id: url_id, tag_id: tag_id)
  end
  
  belongs_to :tagged_url,
    class_name: 'ShortenedUrl',
    foreign_key: :url_id,
    primary_key: :id

  belongs_to :tag,
    class_name: 'TagTopic',
    foreign_key: :tag_id,
    primary_key: :id

end