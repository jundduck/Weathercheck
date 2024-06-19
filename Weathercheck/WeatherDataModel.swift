import Foundation

struct OpenWeatherResponse: Decodable {
    let name: String
    let main: OpenWeatherMain
    let wind: OpenWeatherWind
    let weather: [OpenWeatherWeather]
    
    init(name: String, main: OpenWeatherMain, wind: OpenWeatherWind, weather: [OpenWeatherWeather]) {
        self.name = name
        self.main = main
        self.wind = wind
        self.weather = weather
    }
}

struct OpenWeatherMain: Decodable {
    let temp: Double
    
    init(temp: Double) {
        self.temp = temp
    }
}

struct OpenWeatherWind: Decodable {
    let speed: Double
    
    init(speed: Double) {
        self.speed = speed
    }
}

struct OpenWeatherWeather: Decodable {
    let description: String
    let main: String
    
    init(description: String, main: String) {
        self.description = description
        self.main = main
    }
}

public struct Weather {
    let location: String
    let temperature: String
    let windspeed: String
    let description: String
    let main: String
    
    init(response: OpenWeatherResponse) {
        location = response.name
        temperature = "\(Int(response.main.temp))"
        windspeed = "\(Int(response.wind.speed))"
        description = response.weather.first?.description ?? ""
        main = response.weather.first?.main ?? ""
    }
}
