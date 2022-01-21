class ShortenedUrl < ApplicationRecord
  validates :short_url, presence: true, uniqueness: true
  validates :long_url, presence: true, uniqueness: true
  validates :user_id, presence: true

  def self.random_code
    code = nil
    until code
      code = SecureRandom.urlsafe_base64 
      code = nil if exists?(code)
    end
    code
  end

  def self.shorten_and_insert_url(user, long_url)
    short = ShortenedUrl.new(long_url: long_url, short_url: self.random_code, user_id: user.id)
    short.save!
  end

  def num_clicks
    recorded_visits.count
  end

  def num_uniques
    visitors.count
  end

  def num_recent_uniques
    recorded_visits.where('created_at > ?', 10.minutes.ago).distinct.count
  end



  belongs_to :submitter,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id  

  has_many :recorded_visits,
    class_name: 'Visit',
    foreign_key: :url_id,
    primary_key: :id

  has_many :visitors, 
    -> { distinct },
    through: :recorded_visits, 
    source: :visitor

  has_many :taggings,
    class_name: 'Tagging',
    foreign_key: :url_id,
    primary_key: :id

  has_many :tags, through: :taggings, source: :tag

end