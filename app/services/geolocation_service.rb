class GeolocationService
  include HTTParty
  include ErrorHandler

  base_uri "https://api.opencagedata.com/geocode/v1/json"

  def initialize(api_key)
    @api_key = api_key
  end

  def geo_location(address)
    response = fetch_geolocation(address)
    if response && response.success? && response["results"].present?
      response["results"][0]["geometry"]
    else
      log_error(response)
      nil
    end
  end

  private

  def fetch_geolocation(address)
    self.class.get("", { query: { q: address, key: @api_key } })
  end
end
