class Visit < ApplicationRecord
  validates :url_id, :user_id, presence: true

  def self.record_visit!(user, shortened_url)
    self.create!(user_id: user.id, url_id: shortened_url.id)
  end

  belongs_to :visitor,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id

  belongs_to :visited_url,
    class_name: 'ShortenedUrl',
    foreign_key: :url_id,
    primary_key: :id

end