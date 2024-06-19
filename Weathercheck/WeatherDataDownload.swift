import Foundation
import CoreLocation

class WeatherDataDownload {
    
    private let API_KEY = "9c6e374305e3157e7aefc0dec32848f6"

    func getWeather(location: CLLocationCoordinate2D) async throws -> OpenWeatherResponse {
        guard let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(location.latitude)&lon=\(location.longitude)&appid=\(API_KEY)&units=metric"
                .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { fatalError("URL string not located") }

        guard let url = URL(string: urlString) else {fatalError("URL not located")}
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error") }
                
        let decodedData = try JSONDecoder().decode(OpenWeatherResponse.self, from: data)
        
        return decodedData
    }
}
