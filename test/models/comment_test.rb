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

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
