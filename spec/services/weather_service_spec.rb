# frozen_string_literal: true

require 'spec_helper'

RSpec.describe WeatherService, type: :presenter do
  subject(:weather_service) { described_class.new(date: DateTime.now - 1.day) }

  let(:user) { create(:user) }

  describe '#call' do
    context 'when request is not valid' do
      let(:weather_service) { described_class.new(date: nil) }

      it { expect { weather_service.call }.to raise_error(RuntimeError) }
    end

    context 'when request is valid' do
      it { expect(weather_service.call).to be_truthy }
    end
  end
end
