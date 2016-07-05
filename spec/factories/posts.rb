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

FactoryGirl.define do
  factory :post do
    title FFaker::Lorem.sentence
    body  FFaker::Lorem.paragraphs.join
  end
end
