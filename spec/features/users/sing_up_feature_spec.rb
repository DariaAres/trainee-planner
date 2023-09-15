# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sign up feature', type: :feature do
  subject(:user) { build(:user) }

  before { visit new_user_registration_path }

  describe 'when user is valid' do
    before do
      fill_in 'First name', with: user.first_name
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password
      click_button 'Sign Up'
    end

    it { expect(page).to have_content('Welcome! You have signed up successfully.') }
  end

  describe 'when first_name is not presence' do
    before do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password
      click_button 'Sign Up'
    end

    it { expect(page).to have_content("First name can't be blank") }
  end

  describe 'when email is not presence' do
    before do
      fill_in 'First name', with: user.first_name
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password
      click_button 'Sign Up'
    end

    it { expect(page).to have_content("Email can't be blank") }
  end

  describe 'when password is not presence' do
    before do
      fill_in 'First name', with: user.first_name
      fill_in 'Email', with: user.email
      click_button 'Sign Up'
    end

    it { expect(page).to have_content("Password can't be blank") }
  end

  describe 'when password confirmation is invalid' do
    before do
      fill_in 'First name', with: user.first_name
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: 'password_confirmation'
      click_button 'Sign Up'
    end

    it { expect(page).to have_content("Password confirmation doesn't match Password") }
  end
end
