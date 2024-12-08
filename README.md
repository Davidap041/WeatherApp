# Weather Forecast App

This is a weather forecast application that fetches real-time weather data from an API and displays it in a user-friendly interface. The app shows detailed information such as temperature, humidity, wind speed, and weather conditions, both by hour and by day of the week.

## Features

- **Real-time Weather Data**: The app fetches live weather information from an API.
- **Hourly and Daily Forecast**: Displays weather data in an hourly format as well as for the upcoming week.
- **Temperature, Humidity, Wind Speed**: Shows detailed weather statistics, including temperature, humidity, and wind speed.
- **Weather Conditions**: Provides a brief description of the weather conditions (e.g., clear, cloudy, rainy).
- **Table View & Collection View**: Displays weather data in a Table View for daily forecasts and a Collection View for hourly data.
- **UI Components**: Utilizes UI elements such as UILabel, icons, and images to create an engaging interface.

## Images

<img src="https://github.com/favicon.ico" width="48">
<div style="display: flex; justify-content: space-around;">
  <div style="flex: 1; text-align: center;">
    <img src="https://github.com/user-attachments/assets/2e062664-4a87-469d-8edb-73f3103697ea"  width="450" height: auto;" />
  </div>
</div>

## Technology Stack

- **Language**: Swift
- **Frameworks**:
  - UIKit for UI components like Table Views and Collection Views
  - Foundation for data fetching and JSON decoding
  - URLSession for API requests

## Features Implementation

### 1. **API Integration**

The app fetches weather data from an external API (such as OpenWeatherMap, WeatherAPI, etc.). Data is fetched using `URLSession`, which handles HTTP requests and responses. After the data is received, it is decoded from JSON format using Swift's `Codable` protocol.

### 2. **Table View for Daily Forecast**

A `UITableView` is used to display the weather forecast for the upcoming days. Each cell contains information such as:
- Day of the week
- High and low temperatures
- Weather conditions (e.g., cloudy, sunny, etc.)

### 3. **Collection View for Hourly Forecast**

A `UICollectionView` displays hourly weather data, including:
- Hourly temperatures
- Wind speed
- Conditions (e.g., rain, snow, clear)

### 4. **Dynamic UI Updates**

The weather data is dynamically updated based on the user's location and the API response. The app updates the displayed weather details in real time as the data is fetched.

### 5. **Weather Icons and Images**

Weather conditions are represented visually with icons and images to enhance the user experience. These are fetched from the API and displayed alongside the text data.


## Setting Environment Variables

To manage your **API key**, **latitude**, and **longitude** securely, follow these steps:

### 1. **Create an `.xcconfig` File**

1. In Xcode, create a new **Configuration Settings File** (`.xcconfig`) by going to **File > New > File**.
2. Name the file something like `Environment.xcconfig`.
3. Add your **API key**, **latitude**, and **longitude** to the `.xcconfig` file:

    ```text
    WEATHER_API_KEY = your_api_key_here
    HOME_LATITUDE = your_latitude_here
    HOME_LONGITUDE = your_longitude_here
    ```

   Replace `your_api_key_here`, `your_latitude_here`, and `your_longitude_here` with your actual values.

### 2. **Link the `.xcconfig` File in Xcode**

1. In Xcode, go to your project settings.
2. Under **Build Settings**, add the `.xcconfig` file to the **Debug** and **Release** configurations.

### 3. **Access Environment Variables in Swift**

You can access these environment variables in your app’s code using the `Bundle` class:

```swift
import Foundation

// Access the API key, latitude, and longitude
if let apiKey = Bundle.main.infoDictionary?["WEATHER_API_KEY"] as? String,
   let latitude = Bundle.main.infoDictionary?["HOME_LATITUDE"] as? String,
   let longitude = Bundle.main.infoDictionary?["HOME_LONGITUDE"] as? String {
    print("API Key: \(apiKey)")
    print("Latitude: \(latitude)")
    print("Longitude: \(longitude)")
}
