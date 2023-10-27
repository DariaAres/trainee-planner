# frozen_string_literal: true

class WeatherService
  BASE_URL = 'https://api.ambeedata.com/weather/history/by-lat-lng?'
  API_KEY = ENV['WEATHER_API_KEY']
  LAT = ENV['LATITUDE']
  LNG = ENV['LONGITUDE']

  def initialize(date:)
    @date = date.strftime('%Y-%m-%d')
    @time = date.strftime('%H:%M:%S')
  end

  def call
    headers = { 'X-Api-Key': API_KEY, 'Content-Type': 'application/json' }
    response = HTTParty.get(uri, headers:)
    JSON.parse(response.body)
  end

  private

  def uri
    return @uri if defined?(@uri)

    puts event_date
    @uri = URI(BASE_URL)
    params = { lat: LAT, lng: LNG, from: event_date, to: event_date, units: 'si' }
    @uri.query = URI.encode_www_form(params)
    @uri
  end

  def event_date
    "#{@date} #{@time}"
  end
end
