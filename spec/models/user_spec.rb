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

require 'rails_helper'

RSpec.describe User, :type => :model do

  describe 'validations' do
    it 'with valid model' do
      expect(build(:user)).to be_valid
    end

    it 'has working email presence' do
      expect(build(:user, email: nil)).to_not be_valid
      expect(build(:user, email: '')).to_not be_valid
    end

    describe 'has working email format' do
      it 'which is valid' do
        expect(build(:user, email: 'test@example.com')).to be_valid
      end

      it 'which is invalid' do
        expect(build(:user, email: 'test@example')).to_not be_valid
      end
    end


    it 'has working name presence' do
      expect(build(:user, name: nil)).to_not be_valid
      expect(build(:user, name: '')).to_not be_valid
    end

    it 'has working password presence' do
      expect(build(:user, password: nil)).to_not be_valid
      expect(build(:user, password: '')).to_not be_valid
    end

    it 'has working password and confirmation matching' do
      expect(build(:user, password: 'password', password_confirmation: 'password1')).to_not be_valid
    end
  end

  describe 'scopes' do
    describe '.admins' do
      it 'is initially empty' do
        user = create(:user)
        expect(User.admins.count).to be 0
      end

      it 'has items when inserted' do
        user = create(:user)

        role = create(:role, :admin)
        user.roles << role

        expect(User.admins.count).to be 1
      end
    end

    describe '.guests' do
      it 'is initially empty' do
        user = create(:user)
        expect(User.guests.count).to be 0
      end

      it 'has items when inserted' do
        user = create(:user)

        role = create(:role)
        user.roles << role

        expect(User.guests.count).to be 1
      end
    end

    describe '.moderators' do
      it 'is initially empty' do
        user = create(:user)
        expect(User.moderators.count).to be 0
      end

      it 'has items when inserted' do
        user = create(:user)

        role = create(:role, :moderator)
        user.roles << role

        expect(User.moderators.count).to be 1
      end
    end

  end

  describe 'methods' do
    describe '#has_role?' do
      it 'has no initial roles' do
        user = create(:user)
        expect(user.has_role?(:admin)).to be false
      end

      it 'when role added' do
        user = create(:user)
        role = create(:role)

        user.roles << role

        expect(user.has_role?(:guest)).to be true
      end

      it 'when role removed' do
        user = create(:user)
        role = create(:role, :admin)

        user.roles << role
        user.roles.delete(role)

        expect(user.has_role?(:admin)).to be false
      end
    end
  end

end
