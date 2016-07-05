# == Schema Information
# Schema version: 20160616234202
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :role do
    name 'guest'

    trait :admin do
      name 'admin'
    end

    trait :moderator do
      name 'moderator'
    end
  end
end
