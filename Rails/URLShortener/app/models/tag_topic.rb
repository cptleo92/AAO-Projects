class TagTopic < ApplicationRecord
  validates :tag, presence: true, uniqueness: true

  has_many :taggings,
    class_name: 'Tagging',
    foreign_key: :tag_id,
    primary_key: :id

  has_many :tagged_urls, through: :taggings, source: :tagged_url

  def popular_links
    list = self.tagged_urls
    list_hash = {}
    list.each { |url| list_hash[url] = url.num_clicks }
    (list_hash.sort_by { |k,v| -v }).first(5)
  end
  
end