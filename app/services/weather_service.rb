class WeatherService
  include HTTParty
  include ErrorHandler

  base_uri "https://api.openweathermap.org/data/2.5/weather"

  def initialize(api_key)
    @api_key = api_key
  end

  def current_weather(lat, lon)
    response = fetch_weather(lat, lon)
    if response && response.success?
      response
    else
      ErrorHandler.log_error(response)
      nil
    end
  end

  private

  def fetch_weather(lat, lon)
    self.class.get({ query: { lat: lat, lon: lon, units: "metric", appid: @api_key } })
  end
end
