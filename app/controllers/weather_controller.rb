class WeatherController < ApplicationController
  def show
    address = params[:address]
    return render_error("Address not provided", :bad_request) if address.blank?

    geolocation_service_response = fetch_geolocation(address)
    return render_error("Location not found for address #{address}", :not_found) if geolocation_service_response.nil?

    weather_service_response = fetch_weather(geolocation_service_response)
    return render_error("Unable to obtain weather information for address #{address}", :service_unavailable) if weather_service_response.nil?

    render_weather(weather_service_response)
  end

    private

    def render_error(message, status)
      render json: { error: message }, status: status
    end

    def fetch_geolocation(address)
      geolocation_service = GeolocationService.new(ENV["OPEN_CAGE_API_KEY"])
      geolocation_service.geo_location(address)
    end

    def fetch_weather(geolocation_service_response)
      lat = geolocation_service_response["lat"]
      lon = geolocation_service_response["lng"]
      weather_service = WeatherService.new(ENV["OPEN_WEATHER_API_KEY"])
      weather_service.current_weather(lat, lon)
    end

    def render_weather(weather_service_response)
      render json: {
        description: weather_service_response["weather"][0]["description"],
        temperature: weather_service_response["main"]["temp"],
        feels_like: weather_service_response["main"]["feels_like"]
      }
    end
end
