# == Schema Information
# Schema version: 20160609232315
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_comments_on_post_id  (post_id)
#
# Foreign Keys
#
#  fk_rails_2fd19c0db7  (post_id => posts.id)
#

class Comment < ActiveRecord::Base

  belongs_to :post

  validates :body, presence: true
  validates :post, presence: true

end
