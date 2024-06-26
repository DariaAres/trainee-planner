# frozen_string_literal: true

require 'rails_helper'
require 'factories/user_categories.rb'

RSpec.describe UserCategory, type: :model do
  subject(:user_category) { build(:user_category) }

  context 'when user_category is valid' do
    it { expect(user_category).to be_valid }
  end

  describe 'associations' do
    it { expect(user_category).to belong_to(:user) }
    it { expect(user_category).to belong_to(:category) }
  end
end
