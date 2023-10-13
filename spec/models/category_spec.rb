# frozen_string_literal: true

require 'rails_helper'
require 'factories/categories'

RSpec.describe 'Category', type: :model do
  subject(:category) { build(:category) }

  context 'when category is valid' do
    it { expect(build(:category)).to be_valid }
  end

  describe 'validations' do
    it { expect(category).to validate_presence_of :name }

    describe 'uniqueness validation' do
      subject(:category) { create(:category) }

      it { expect(category).to validate_uniqueness_of(:name).case_insensitive }
    end
  end

  describe 'traits' do
    context "when name of category is 'Personal'" do
      let(:category) { build(:category, :personal) }

      it { expect(category.name).to eql 'Personal' }
    end

    context "when name of category is 'Work'" do
      let(:category) { build(:category, :work) }

      it { expect(category.name).to eql 'Work' }
    end

    context "when name of category is 'Rest'" do
      let(:category) { build(:category, :rest) }

      it { expect(category.name).to eql 'Rest' }
    end
  end

  describe 'associations' do
    it { expect(category).to have_many(:user_categories) }
    it { expect(category).to have_many(:users).through(:user_categories) }
  end
end
