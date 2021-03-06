# == Schema Information
#
# Table name: todos
#
#  id    :bigint           not null, primary key
#  title :string           not null
#  body  :string           not null
#  done  :boolean          default(FALSE), not null
#
class Todo < ApplicationRecord
  validates :title, :body, presence: true
  validates :done, inclusion: { in: [true, false] }

  has_many :taggings
  has_many :tags, through: :taggings

  has_many :steps

  def tag_names=(tag_names)
    self.tags = tag_names.map do |tag_name|
      Tag.find_or_create_by(name: tag_name)
    end
  end
end
