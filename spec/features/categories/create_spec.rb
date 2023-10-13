# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Category create', type: :feature do
  let(:user) { create(:user) }

  describe 'create category' do
    let(:category) { build(:category, :work) }

    before do
      login_as(user)
      visit new_category_path
      fill_in 'Name', with: category.name
      click_button 'Create'
    end

    it { expect(page).to have_content(I18n.t('category.category_created')) }
    it { expect(page).to have_content('Work') }
  end

  describe 'name of category has already been taken' do
    let(:category_work) { build(:category, :work) }

    before do
      create(:category, :work)
      login_as(user)
      visit new_category_path
      fill_in 'Name', with: category_work.name
      click_button 'Create'
    end

    it { expect(page).to have_content(I18n.t('category.name_has_taken')) }
  end
end
