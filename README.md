# iOS Weather App

This app is built using Swift.

## Features
- Retrieves current weather
- Displays weather forecast for up to 7 days
- Allows changing of location

This app uses the OpenWeather API to fetch current weather data.

## Changing the API Key

To change the API key, follow these steps:

1. Navigate to `data/OpenWeatherRepository`.
2. On line 12, you will find:
    ```swift
    static let baseUrl = "https://api.openweathermap.org/data/2.5/forecast/daily?cnt=7&units=metric&APPID=<REPLACEME>"
    ```
3. Replace `<REPLACEME>` with an actual OpenWeather API key.

## Getting an OpenWeather API Key

To get an API key, visit the [OpenWeather website](https://home.openweathermap.org/users/sign_up) and sign up for an account.

Once you have the API key, update the code as described above, and the app should work.
