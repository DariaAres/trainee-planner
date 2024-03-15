# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'events/show', type: :view do
  let(:event) { create(:event, user:) }
  let(:user) { create(:user) }
  let(:weather_service) { WeatherService.new(date: event.event_date) }
  let(:weather_presenter) { WeatherPresenter.new(weather_service, event.event_date) }

  before do
    sign_in(user)
    assign(:event, event)
    assign(:weather, weather_presenter)
    render template: 'events/show'
  end

  it 'has field name' do
    expect(rendered).to include(CGI.escapeHTML(event.name))
  end

  describe 'buttons' do
    it { expect(rendered).to have_xpath '//button[contains(@class, btn)]' }
    it { expect(rendered).to have_xpath '//a[contains(@class, btn)]' }
  end
end
