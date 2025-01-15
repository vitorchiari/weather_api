# Weather API (Rails)

This is a simple API built with **Ruby on Rails** that returns current weather information for a given address using the **OpenCage** and **OpenWeather** APIs.

## Features

- Accepts an **address** as a parameter.
- Makes a request to the **OpenCage** service to get the geographic coordinates of the address.
- With the coordinates, makes a request to **OpenWeather** to retrieve weather information.
- Returns current weather data in JSON format, including weather description, temperature, and feels-like temperature.

## Endpoints

### 1. `/weather`

#### Method: `GET`

Retrieves weather information for a given address.

**Query Parameters**:

- `address`: The address for which you want to query the weather.

**Example Request**:

```
GET /weather?address=São+Paulo
```

**Example Response**:

```json
{
  "description": "few clouds",
  "temperature": 25.39,
  "feels_like": 25.76
}
```

## How to Run Locally

### Prerequisites

- Ruby (version 2.7 or higher)
- Rails (version 6 or higher)
- Bundler

### Steps

1. **Clone the repository** to your local machine.

```bash
git clone https://github.com/vitorchiari/weather_api.git
```

2. **Install the project's dependencies**.

```bash
cd weather-api
bundle install
```

3. **Configure your API keys** for OpenCage and OpenWeather in the `.env` file.

Create a `.env` file in the root of the project and add your API keys:

```
OPEN_CAGE_API_KEY=your-opencage-api-key
OPEN_WEATHER_API_KEY=your-openweather-api-key
```

4. **Start the Rails server**.

```bash
rails server
```

The API will be running at `http://localhost:3000`.

### Testing the API

You can now test the API by accessing the `/weather` endpoint with an address as a parameter. Example:

```
http://localhost:3000/weather?address=São+Paulo
```

## Dependencies

- **httparty**: For making HTTP requests to external services.
- **dotenv**: For loading environment variables securely.
- **rails**: Framework for creating the API in Ruby on Rails.

## APIs Used

- **OpenCage**: For geolocating and getting the coordinates of the address.
  - [OpenCage Documentation](https://opencagedata.com/)

- **OpenWeather**: For retrieving current weather conditions based on the coordinates.
  - [OpenWeather Documentation](https://openweathermap.org/api)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for more details.
