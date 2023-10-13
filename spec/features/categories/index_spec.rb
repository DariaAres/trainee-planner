# frozen_string_literal: true

require 'rails_helper'
require 'factories/user_categories'

RSpec.describe 'Category show', type: :feature do
  describe 'index category' do
    let(:category) { build(:category) }
    let(:user) { create(:user) }

    describe 'when user is authenticated' do
      before do
        create(:user_category, user:, category:)
        login_as(user)
        visit categories_path
      end

      let!(:category) { create(:category) }

      it { expect(page).to have_content(I18n.t('category.categories')) }
      it { expect(page).to have_content(category.name) }
      it { expect(page).to have_button(I18n.t('category.delete')) }
    end

    describe 'when user is not authenticated' do
      before do
        visit categories_path
      end

      it { expect(page).to have_no_content(I18n.t('category.create_new')) }
      it { expect(page).to have_no_content(category.name) }
    end
  end
end
