# frozen_string_literal: true

require 'rails_helper'
require 'factories/users'

RSpec.describe 'Edit user profile' do
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
    visit edit_user_registration_path
  end

  describe 'when password is changed' do
    before do
      fill_in 'Password', with: 'new_password'
      fill_in 'Password confirmation', with: 'new_password'
      fill_in 'Current password', with: user.password
      click_button 'Update'
    end

    it { expect(page).to have_content('Your account has been updated successfully.') }
  end

  describe 'when current password isn\'t presence' do
    before { click_button 'Update' }

    it { expect(page).to have_content("Current password can't be blank") }
  end

  describe 'when password confirmation is invalid' do
    before do
      fill_in 'Password', with: 'new_password'
      fill_in 'Password confirmation', with: 'invalid_password_confiramtion'
      fill_in 'Current password', with: user.password
      click_button 'Update'
    end

    it { expect(page).to have_content("Password confirmation doesn't match Password") }
  end

  describe 'when account is canceled' do
    before do
      click_button 'Cancel'
    end

    it { expect(page).to have_current_path('/en') }
  end
end
