import SwiftUI
import CoreLocationUI
import CoreLocation

struct WeatherView: View {
    @EnvironmentObject var locationManager: LocationManager
    var openWeatherResponse: OpenWeatherResponse
    
    private let iconList = [
        "Clear": "☀️",
        "Clouds": "☁️",
        "Mist": "🌫",
        "": "?",
        "Drizzle": "🌦",
        "Thunderstorm": "🌩",
        "Rain": "🌧",
        "Snow": "❄️"
    ]
    
    private var windspeed: Int {
        Int(Weather(response: openWeatherResponse).windspeed) ?? 0
    }
    
    private var temperature: Int {
        Int(Weather(response: openWeatherResponse).temperature) ?? 0
    }
    
    private var warning: String {
        if windspeed >= 10 {
            return "Construction Impossible \n : By wind"
        } else {
            if temperature <= 0 {
                return "Construction Impossible \n : By low temperature"
            } else {
                if temperature >= 37 {
                    return "Construction Impossible \n : By high temperature"
                } else {
                    return "Construction Possible"
                }
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text(Weather(response: openWeatherResponse).location)
                    .font(.custom("Futura", size: 30))
                    .foregroundColor(.black)
                    .padding()
                
                Text(Weather(response: openWeatherResponse).temperature)
                    .font(.custom("Futura", size: 70))
                    .foregroundColor(.black)
                
                Text(iconList[Weather(response: openWeatherResponse).main] ?? "")
                    .font(.custom("Futura", size: 80))
                    .foregroundColor(.black)
                
                VStack(spacing: 10) {
                    Text(Weather(response: openWeatherResponse).description)
                        .font(.custom("Futura", size: 25))
                        .foregroundColor(.black)
                        .padding()
                    
                    HStack(spacing: 0) {
                        Text("Wind Speed: ")
                            .font(.custom("Futura", size: 15))
                            .foregroundColor(.black)
                        
                        Text(Weather(response: openWeatherResponse).windspeed)
                            .font(.custom("Futura", size: 15))
                            .foregroundColor(.black)
                        
                        Text("m/s")
                            .font(.custom("Futura", size: 15))
                            .foregroundColor(.black)
                    }
                    
                    Text(warning)
                        .font(.custom("Futura", size: 25))
                        .foregroundColor(.black)
                        .italic()
                        .multilineTextAlignment(.center)
                }
                
                LocationButton(.shareCurrentLocation) {
                    locationManager.requestLocation()
                }
                .frame(width: 250, height: 50)
                .background(Color.blue)
                .foregroundColor(.black)
                .cornerRadius(10)
                .padding()
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 4)
            )
            .padding()
        }
    }
}
