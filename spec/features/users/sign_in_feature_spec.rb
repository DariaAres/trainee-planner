# frozen_string_literal: true

require 'rails_helper'
require 'factories/users'

RSpec.describe 'Sign in page', type: :feature do
  subject(:user) { build(:user) }

  before { visit new_user_session_path }

  describe 'when password and login are valid' do
    let(:user) { create(:user) }

    before do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    it { expect(page).to have_content('Signed in successfully.') }
  end

  describe 'when password is invalid' do
    let(:user) { create(:user) }

    before do
      fill_in 'Email', with: user.email
      click_button 'Log in'
    end

    it { expect(page).to have_content('Invalid Email or password.') }
  end

  describe 'when email is invalid' do
    let(:user) { create(:user) }

    before do
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    it { expect(page).to have_content('Invalid Email or password.') }
  end
end
