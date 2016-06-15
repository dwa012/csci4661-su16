# == Schema Information
# Schema version: 20160608001817
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
end
