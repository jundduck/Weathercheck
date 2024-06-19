
import SwiftUI

@main
struct NewWeatherApp: App {
    
    @StateObject var locationManager = LocationManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationManager)
        }
    }
}
