//
//  WeatherData.swift
//  WeatherYandexApi
//
//  Created by Александр Борисов on 30.01.2023.
//

import Foundation

struct WeatherData: Decodable {
    let info: Info
    let fact: Fact
    let forecasts: [Forecast]
}


//MARK: - Info
struct Info: Decodable {
    let url: String
}


//MARK: - Fact
struct Fact: Decodable {
    let temp: Double
    let icon: String
    let condition: String
    let windSpeed: Double
    let pressureMm: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case icon
        case condition
        case windSpeed = "wind_speed"
        case pressureMm = "pressure_mm"
    }
}


//MARK: - Forecast
struct Forecast: Decodable {
    let parts: Parts
}


//MARK: - Parts - Forecast
struct Parts: Decodable {
    let day: Day
}


//MARK: - Day - Parts - Forecast
struct Day: Decodable {
    let tempMin: Int?
    let tempMax: Int?

    enum CodingKeys: String, CodingKey {
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}
