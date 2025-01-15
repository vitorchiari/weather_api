module ErrorHandler
  def log_error(response)
    error_message = response.nil? ? "Unkown error" : "#{response.code} - #{response.message}"
    Rails.logger.error "Error while fetching data: #{error_message}"
  end
end
