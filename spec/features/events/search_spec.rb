# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Searching', type: :feature do
  let(:user) { create(:user) }
  let(:category) { create(:category) }

  describe 'search and filter' do
    let!(:event_one) { create(:event, user:, category:, name: 'One') }
    let!(:event_two) { create(:event, user:, category:, name: 'Two') }

    before do
      create(:user_category, user:, category:)
      login_as(user)
      visit events_path
    end

    context 'when search by name & category' do
      before do
        fill_in 'Name', with: event_one.name
        select category.name, from: 'Select category'
        click_button 'Search'
      end

      it { expect(page).to have_content(event_one.name) }
    end

    context 'when search by unknown name' do
      before do
        fill_in 'Name', with: 'unknown name'
        click_button 'Search'
      end

      it { expect(page).to have_content('No events') }
      it { expect(page).not_to have_content(event_one.name) }
      it { expect(page).not_to have_content(event_two.name) }
    end
  end
end
