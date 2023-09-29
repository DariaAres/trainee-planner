# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Locales', type: :feature do
  describe 'Switching between locales' do
    before { visit root_path }

    describe 'Switch language to ru' do
      before do
        click_button 'Language'
        click_link 'Русский'
      end

      it { expect(page).to have_xpath "//p[contains(text(), 'Create or sign in an account')]" }
    end

    describe 'Switch language to en' do
      before do
        click_button 'Language'
        click_link 'English'
      end

      it { expect(page).to have_xpath "//p[contains(text(), 'Create or sign in an account')]" }
    end
  end
end
