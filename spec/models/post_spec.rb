# == Schema Information
# Schema version: 20160616234202
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_5b5ddfd518  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Post, :type => :model do

  describe 'validations' do
    it 'with valid model' do
      expect(build(:post)).to be_valid
    end

    it 'has working title presence' do
      expect(build(:post, title: nil)).to_not be_valid
      expect(build(:post, title: '')).to_not be_valid
    end

    it 'has working body presence' do
      expect(build(:post, body: nil)).to_not be_valid
      expect(build(:post, body: '')).to_not be_valid
    end
  end

end
