# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Category edit', type: :feature do
  describe 'edit category' do
    let(:user) { create(:user) }
    let!(:category) { create(:category) }

    describe 'when user is authenticated' do
      before do
        login_as(user)
        visit edit_category_path(category.id, locale: I18n.locale)
        fill_in 'Name', with: 'Category name'
        click_button 'Edit'
      end

      it { expect(page).to have_content(I18n.t('category.category_updated')) }
    end

    describe 'name of category has already exist' do
      before do
        login_as(user)
        visit edit_category_path(category.id, locale: I18n.locale)
        fill_in 'Name', with: ''
        click_button 'Edit'
      end

      it { expect(page).to have_content(I18n.t('category.name_not_blank')) }
    end

    describe 'when user is not authenticated' do
      before do
        login_as(user)
        visit edit_category_path(category.id, locale: I18n.locale)
      end

      it { expect(page).to have_no_content(I18n.t('category.category_updated')) }
    end
  end
end
