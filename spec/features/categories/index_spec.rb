# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Category show', type: :feature do
  describe 'index category' do
    let(:user) { create(:user) }
    let!(:category) { create(:category) }

    describe 'when user is authenticated' do
      before do
        login_as(user)
        visit categories_path
      end

      it { expect(page).to have_content('Categories') }
      it { expect(page).to have_content(category.name) }
      it { expect(page).to have_button('Delete') }
    end

    describe 'when user is not authenticated' do
      before do
        visit categories_path
      end

      it { expect(page).to have_no_content('Create new') }
      it { expect(page).to have_no_content(category.name) }
    end
  end
end
