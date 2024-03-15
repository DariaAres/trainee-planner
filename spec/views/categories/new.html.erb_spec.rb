# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'categories/new', type: :view do
  let(:category) { build(:category) }
  let(:user) { create(:user) }

  before do
    sign_in(user)
    assign(:category, category)
    render template: 'categories/new'
  end

  it 'field category name' do
    expect(rendered).to include(CGI.escapeHTML(category.name))
  end

  it 'submit button' do
    expect(rendered).to have_xpath '//input[contains(@class, btn)]'
  end
end
