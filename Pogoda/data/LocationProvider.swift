//
//  LocationProvider.swift
//  Pogoda
//
//  Created by Paweł Łukasiewicz on 19/12/2023.
//

import Foundation
import CoreLocation

class LocationProvider : NSObject, CLLocationManagerDelegate {
    
    private let manager = CLLocationManager()
    private var continuation: CheckedContinuation<CLLocation, Error>!
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    var currentLocation: CLLocation {
        get async throws {
            return try await withCheckedThrowingContinuation { continuation in
                self.continuation = continuation
                
                manager.requestLocation()
            }
        }
    }
    
    func askForPermissionIfNeed() {
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        default:
            print()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let loc = locations.last {
            continuation.resume(returning: loc)
            continuation = nil
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        continuation.resume(throwing: error)
        continuation = nil
    }
    
}
