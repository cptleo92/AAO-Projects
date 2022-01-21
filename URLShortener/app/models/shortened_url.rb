class ShortenedUrl < ApplicationRecord
  validates :short_url, presence: true, uniqueness: true
  validates :long_url, presence: true, uniqueness: true
  validates :user_id, presence: true
  validate :no_spamming, :nonpremium_max

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

  def self.prune(n)
    stale = ShortenedUrl
              .where('created_at < ?', n.minutes.ago)           
              .select { |url| url.num_clicks == 0 }
    stale.each do |url|
      url.destroy unless url.submitter.premium
    end
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

  private
  def no_spamming
    spam =  ShortenedUrl.where('created_at > ?', 1.minute.ago).where(user_id: user_id).count 
    errors[:base] << 'Too many attempts!' if spam >= 5
  end

  def nonpremium_max
    prem = User.find(self.user_id).premium
    submitted = User.find(self.user_id).submitted_urls.count
    errors[:base] << 'Free members are limited to 5 urls!' if submitted >= 5 && !prem
  end

  belongs_to :submitter,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id  

  has_many :recorded_visits,
    class_name: 'Visit',
    foreign_key: :url_id,
    primary_key: :id,
    dependent: :destroy

  has_many :visitors, 
    -> { distinct },
    through: :recorded_visits, 
    source: :visitor

  has_many :taggings,
    class_name: 'Tagging',
    foreign_key: :url_id,
    primary_key: :id,
    dependent: :destroy

  has_many :tags, through: :taggings, source: :tag

end