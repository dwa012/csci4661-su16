# == Schema Information
# Schema version: 20160616234202
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

require 'rails_helper'

RSpec.describe Comment, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
