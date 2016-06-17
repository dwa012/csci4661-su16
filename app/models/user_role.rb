class UserRole < ActiveRecord::Base
  belongs_to :user
  belongs_to :role

  validates :role, presence: true, uniqueness: { scope: [:user], message: 'can only be assigned once per user' }
  validates :user, presence: true
end
