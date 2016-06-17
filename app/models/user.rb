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

class User < ActiveRecord::Base
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :posts

  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles

  validates :name, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  scope :admins, -> { joins(:roles).where(roles: { name: 'admin' }) }
  scope :moderators, -> { joins(:roles).where(roles: { name: 'moderator' }) }
  scope :guests, -> { joins(:roles).where(roles: { name: 'guest' }) }
end
