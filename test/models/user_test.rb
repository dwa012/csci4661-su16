# == Schema Information
# Schema version: 20160615001402
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :text             not null
#  name            :text             not null
#  password_digest :text             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
