//
//  ViewModel.swift
//  Pogoda
//
//  Created by Paweł Łukasiewicz on 28/11/2023.
//

import Foundation
import Combine
import CoreLocation

class ViewModel : ObservableObject {
    @Published var city: String = "Warsaw"
    @Published var forecast: DayForecast?
    @Published var nextDaysForecasts: [DayForecast] = []
    @Published var showSettings = false
    
    private var repository = OpenWeatherRepository()
    private let locationProvider = LocationProvider()
    
    init() {
        locationProvider.askForPermissionIfNeed()
    }
    
    func refreshData() {
        Task {
            await refreshData(city: self.city)
        }
    }
    
    func refreshDataWithLocation() {
        Task {
            guard let location = try? await locationProvider.currentLocation else { return }
            await refreshData(location: location)
        }
    }
    
    @MainActor
    private func refreshData(location: CLLocation) async {
        guard let data = await repository.getData(lat: location.coordinate.latitude, lon: location.coordinate.longitude) else { return }
        
        let forecast = data.mapToDomain()
        self.city = forecast.city
        self.forecast = forecast.dayForecast.first!
        self.nextDaysForecasts = []
        self.nextDaysForecasts.append(contentsOf:forecast.dayForecast.dropFirst())
    }
    
    @MainActor
    private func refreshData(city: String) async {
        guard let data = await repository.getData(city: city) else { return }
        
        let forecast = data.mapToDomain()
        self.city = forecast.city
        self.forecast = forecast.dayForecast.first!
        self.nextDaysForecasts = []
        self.nextDaysForecasts.append(contentsOf:forecast.dayForecast.dropFirst())
    }
}
