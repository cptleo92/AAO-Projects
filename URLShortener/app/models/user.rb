class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_many :submitted_urls,
    class_name: 'ShortenedUrl',
    foreign_key: :user_id,
    primary_key: :id

  has_many :visits_to_url,
    class_name: 'Visit',
    foreign_key: :user_id,
    primary_key: :id

  has_many :urls_visited, 
    -> { distinct },
    through: :visits_to_url, 
    source: :visited_url

end