# == Schema Information
#
# Table name: steps
#
#  id      :bigint           not null, primary key
#  title   :string           not null
#  body    :string           not null
#  todo_id :integer          not null
#  done    :boolean          default(FALSE), not null
#
class Step < ApplicationRecord
  validates :title, :body, :todo_id, presence: true
  validates :done, inclusion: { in: [true, false] }

  belongs_to :todo
  
end
