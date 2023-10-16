# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Event create', type: :feature do
  let(:user) { create(:user) }
  let!(:category) { create(:category) }
  let(:event) { build(:event) }

  describe 'when user is authenticated' do
    before do
      create(:user_category, user:, category:)
      login_as(user)
      visit new_event_path
    end

    describe 'create event' do
      before do
        fill_in 'Name', with: event.name
        fill_in 'Event date', with: event.event_date
        select category.name, from: 'Select category'
        click_button 'Create'
      end

      it { expect(page).to have_content(I18n.t('event.event_created')) }
      it { expect(page).to have_content(event.name) }
      it { expect(page).to have_content(category.name) }
    end

    describe 'name of event is empty' do
      before do
        fill_in 'Event date', with: event.event_date
        select category.name, from: 'Select category'
        click_button 'Create'
      end

      it { expect(page).to have_content(I18n.t('event.name_is_blank')) }
    end

    describe 'event date is empty' do
      before do
        fill_in 'Name', with: event.name
        select category.name, from: 'Select category'
        click_button 'Create'
      end

      it { expect(page).to have_content(I18n.t('event.date_is_blank')) }
    end

    describe 'event date is in the past' do
      before do
        fill_in 'Event date', with: DateTime.now.yesterday
        fill_in 'Name', with: event.name
        select category.name, from: 'Select category'
        click_button 'Create'
      end

      it { expect(page).to have_content(I18n.t('event.date_past')) }
    end

    describe 'reminder_on is in the past' do
      before do
        fill_in 'Event date', with: DateTime.now.tomorrow
        fill_in 'Date to notificate', with: DateTime.now.yesterday
        fill_in 'Name', with: event.name
        select category.name, from: 'Select category'
        click_button 'Create'
      end

      it { expect(page).to have_content(I18n.t('event.mention_past')) }
    end

    describe 'reminder_on is greater than event_date' do
      before do
        fill_in 'Event date', with: DateTime.now.tomorrow
        fill_in 'Date to notificate', with: DateTime.now.tomorrow + 1.minute
        fill_in 'Name', with: event.name
        select category.name, from: 'Select category'
        click_button 'Create'
      end

      it { expect(page).to have_content(I18n.t('event.mention_future')) }
    end

    describe 'reminder_on is equal to event_date' do
      before do
        fill_in 'Event date', with: DateTime.now.tomorrow
        fill_in 'Date to notificate', with: DateTime.now.tomorrow
        fill_in 'Name', with: event.name
        select category.name, from: 'Select category'
        click_button 'Create'
      end

      it { expect(page).to have_content(I18n.t('event.mention_future')) }
    end
  end

  describe 'when user is not authenticated' do
    before do
      create(:user_category, user:, category:)
      login_as(user)
      visit new_event_path
    end

    it { expect(page).to have_no_content('Event has been successfully created') }
    it { expect(page).to have_no_content(event.name) }
  end
end
