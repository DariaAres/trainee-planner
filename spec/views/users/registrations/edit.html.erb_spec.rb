# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/registrations/edit.html.erb', type: :view do
  let(:user) { create(:user) }

  before do
    without_partial_double_verification do
      allow(view).to receive(:resource).and_return(User.new)
      allow(view).to receive(:resource_name).and_return(:user)
      allow(view).to receive(:devise_mapping).and_return(Devise.mappings[:user])
    end
    render template: 'users/registrations/edit'
  end

  it { expect(rendered).to have_xpath "//input[contains(@id, 'email')]" }
  it { expect(rendered).to have_xpath "//input[contains(@id, 'password')]" }
  it { expect(rendered).to have_xpath "//input[contains(@id, 'password_confirmation')]" }
  it { expect(rendered).to have_xpath "//input[contains(@id, 'current_password')]" }
  it { expect(rendered).to have_button 'Update' }
end
