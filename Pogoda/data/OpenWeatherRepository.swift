//
//  OpemWeatherRepository.swift
//  Pogoda
//
//  Created by Paweł Łukasiewicz on 05/12/2023.
//

import Foundation

class OpenWeatherRepository {
    
    static let baseUrl = "https://api.openweathermap.org/data/2.5/forecast/daily?cnt=7&units=metric&APPID=e60064a718077349a2f3cdb075ffaad2"
    
    
    func getData(city: String) async -> ForecastDto? {
        let stringUrl = OpenWeatherRepository.baseUrl + "&q=\(city)"
        return await getData(url: stringUrl)
    }
    
    func getData(lat: Double, lon: Double) async -> ForecastDto? {
        let stringUrl = OpenWeatherRepository.baseUrl + "&lat=\(lat)&lon=\(lon)"
        return await getData(url: stringUrl)
    }
    
    func getData(url: String) async -> ForecastDto? {
        guard let url = URL(string: url) else { return nil }
        let dataWithResponse = try? await URLSession.shared.data(from: url)
        guard let (data, _) = dataWithResponse else { return nil }
        return try? JSONDecoder().decode(ForecastDto.self, from: data)
    }
    
}
