# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Category delete', type: :feature do
  describe 'delete category' do
    let(:user) { create(:user) }

    describe 'when user is authenticated' do
      before do
        login_as(user)
        create(:category)
        visit categories_path
        within('.list-group') do
          click_button 'Delete'
        end
      end

      it { expect(page).to have_content('Category has been deleted successfully') }
    end

    describe 'when user is not authenticated' do
      before do
        create(:category)
        visit categories_path
      end

      it { expect(page).to have_no_content('Category has been deleted successfully') }
    end
  end
end
