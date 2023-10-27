# frozen_string_literal: true

class WeatherPresenter
  def initialize(data, date)
    @data = data.call.with_indifferent_access
    @date = date
  end

  def temperature
    return current_weather['temperature'] if success

    current_weather
  end

  def summary
    return current_weather['summary'] if success

    current_weather
  end

  def wind_speed
    return current_weather['windSpeed'] if success

    current_weather
  end

  def humidity
    return current_weather['humidity'] if success

    current_weather
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

  def success
    !(data['message'] != 'success')
  end

  private

  attr_reader :data

  def current_weather
    @current_weather = success ? data['data']['history'].first : I18n.t('weather.not_available')
  end

  def join_date(time)
    "#{@date.strftime('%Y-%m-%d')} #{time}".to_datetime
  end

  def get_presenter(time)
    weather_service = WeatherService.new(date: join_date(time))
    WeatherPresenter.new(weather_service, join_date(time))
  end
end
