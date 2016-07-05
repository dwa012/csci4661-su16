# == Schema Information
# Schema version: 20160616234202
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

FactoryGirl.define do
  factory :user do
    email FFaker::Internet.email
    name  FFaker::Name.name
    password 'password'
    password_confirmation 'password'
  end

  factory :admin_user, class: User do
    email FFaker::Internet.email
    name  FFaker::Name.name
    password 'password'
    password_confirmation 'password'

    # roles { create :role, :admin }
  end

end
