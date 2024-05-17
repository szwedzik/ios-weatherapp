//
//  Mappers.swift
//  Pogoda
//
//  Created by Paweł Łukasiewicz on 19/12/2023.
//

import Foundation


extension ForecastDto {
    func mapToDomain() -> Forecast {
        Forecast(
            city: self.city.name,
            dayForecast: self.forecast.map { $0.mapToDomain() }
        )
    }
}

private let iconMap = ["01d": "sun.max.fill", "02d": "cloud.sun.fill", "03d": "cloud.fill", "04d": "smoke.fill", "09d": "cloud.rain.fill", "10d": "cloud.sun.rain.fill", "11d": "cloud.sun.bolt.fill", "13d": "snow", "50d": "cloud.fog.fill"]

extension DayForecastDto {
    func mapToDomain() -> DayForecast {
        let date = Date(timeIntervalSince1970: date)
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("EE")
        let stringDate = formatter.string(from: date)
        
        guard let icon = weather.first?.icon,
              let systemIcon = iconMap[icon] else { fatalError() }
        guard let description = weather.first?.description else { fatalError() }
        let temperature = temperature.day
        
        return DayForecast(date: stringDate, icon: systemIcon, description: description, temperature: "\(Int(temperature))°", pressure: "\(Int(pressure)) hPa")
    }
}
