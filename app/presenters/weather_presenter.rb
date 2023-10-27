# frozen_string_literal: true

class WeatherPresenter
  def initialize(data, date)
    @data = data.with_indifferent_access
    @date = date
  end

  def temperature
    current_weather['temperature']
  end

  def summary
    current_weather['summary']
  end

  def wind_speed
    current_weather['windSpeed']
  end

  def humidity
    current_weather['humidity']
  end

  def weather_morning
    get_presenter('09:00:00')
  end

  def weather_day
    get_presenter('14:00:00')
  end

  def weather_evening
    get_presenter('19:00:00')
  end

  private

  attr_reader :data

  def current_weather
    @current_weather = data['data']['history'].first
  end

  def join_date(time)
    "#{@date.strftime('%Y-%m-%d')} #{time}".to_datetime
  end

  def get_presenter(time)
    weather_service = WeatherService.new(date: join_date(time))
    WeatherPresenter.new(weather_service.call, join_date(time))
  end
end
