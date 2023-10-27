# frozen_string_literal: true

RSpec.describe WeatherPresenter, type: :presenter do
  let(:user) { create(:user) }
  let(:weather_service) { WeatherService.new(date: DateTime.now - 1.day) }

  describe '#weather' do
    context 'when weather is available' do
      let(:weather_service) { WeatherService.new(date: DateTime.now - 1.day) }
      let(:weather_presenter) { described_class.new(weather_service, DateTime.now - 1.day) }

      it { expect(weather_presenter.temperature).not_to eq('Weather is not available') }
      it { expect(weather_presenter.humidity).not_to eq('Weather is not available') }
      it { expect(weather_presenter.summary).not_to eq('Weather is not available') }
    end

    context 'when weather is not available' do
      let(:weather_service) { WeatherService.new(date: DateTime.now - 10.days) }
      let(:weather_presenter) { described_class.new(weather_service, DateTime.now - 10.days) }

      it { expect(weather_presenter.temperature).to eq('Weather is not available') }
      it { expect(weather_presenter.humidity).to eq('Weather is not available') }
      it { expect(weather_presenter.summary).to eq('Weather is not available') }
    end
  end
end
