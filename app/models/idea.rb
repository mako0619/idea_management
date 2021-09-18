# == Schema Information
#
# Table name: ideas
#
#  id          :bigint           not null, primary key
#  category_id :bigint           not null
#  body        :text(65535)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Idea < ApplicationRecord
  belongs_to :category
  validates :body, presence: true
end
