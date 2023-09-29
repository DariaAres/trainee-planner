# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'events/new', type: :view do
  let(:event) { build(:event) }
  let(:user) { create(:user) }

  before do
    sign_in(user)
    assign(:event, event)
    render template: 'events/new'
  end

  it 'has field name' do
    expect(rendered).to include(CGI.escapeHTML(event.name))
  end

  it 'submit button' do
    expect(rendered).to have_xpath '//input[contains(@class, btn)]'
  end
end
