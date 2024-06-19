import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var locationManager : LocationManager
    var weatherDataDownload = WeatherDataDownload()
    @State var openWeatherResponse : OpenWeatherResponse?
    
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                if let  openWeatherResponse = openWeatherResponse {
                    WeatherView(openWeatherResponse: openWeatherResponse)
                } else {
                    ProgressView()
                        .task {
                                openWeatherResponse = try? await weatherDataDownload.getWeather(location: location)
                        }
                }
                
            } else {
                if locationManager.isLoading {
                    ProgressView()
                } else {
                    FirstView()
                }
            }
        }
    }
}
