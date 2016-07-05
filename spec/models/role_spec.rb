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

require 'rails_helper'

RSpec.describe Role, :type => :model do
  describe 'validations' do
    it 'with valid model' do
      expect(build(:role)).to be_valid
    end

    it 'with working presence validation' do
      expect(build(:role, name: nil)).to_not be_valid
      expect(build(:role, name: '')).to_not be_valid
    end
  end
end
