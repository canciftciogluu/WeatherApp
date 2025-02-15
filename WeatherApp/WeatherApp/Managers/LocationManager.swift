
//
// LocationManager.swift
//  WeatherCanoo
//
//  Created by Can Ciftcioglu on 15.02.2025.
//
import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D? = CLLocationCoordinate2D(latitude: 41.0082, longitude: 28.9784) // İstanbul'un koordinatları
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let newLocation = locations.first?.coordinate {
            location = newLocation
        } else {
            location = CLLocationCoordinate2D(latitude: 41.0082, longitude: 28.9784) // Varsayılan olarak İstanbul
        }
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location:", error)
        location = CLLocationCoordinate2D(latitude: 41.0082, longitude: 28.9784) // Hata alırsa İstanbul'u kullan
        isLoading = false
    }
}


