# == Schema Information
#
# Table name: taggings
#
#  id      :bigint           not null, primary key
#  tag_id  :integer          not null
#  todo_id :integer          not null
#
class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :todo
end
