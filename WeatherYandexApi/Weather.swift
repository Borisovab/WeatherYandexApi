//
//  Weather.swift
//  WeatherYandexApi
//
//  Created by Александр Борисов on 30.01.2023.
//

import Foundation

struct Weather {
    var name: String = "Название"
    var temperature: Double = 0.0

    var temperatureString: String {
        return String(format: "%.0f", temperature) + "º"
    }

    var iconCondition: String = ""
    var url: String = ""
    var condition: String = ""
    var pressureMm: Int = 0

    var pressureMmString: String {
        return String(pressureMm) + " мм.рт.ст"
    }

    var windSpeed: Double = 0.0

    var windSpeedString: String {
        return String(windSpeed) + " м/с"
    }

    var tempMin: Int = 0

    var tempMinString: String {
        return String(tempMin) + "º C"
    }

    var tempMax: Int = 0

    var tempMaxString: String {
        return String(tempMin) + "º C"
    }

    var conditionTranslate: String {
        switch condition {
        case "clear":                  return "ясно"
        case "partly-cloudy":          return "малооблачно"
        case "cloudy":                 return "облачно с прояснениями"
        case "overcast":               return "пасмурно"
        case "drizzle":                return "морось"
        case "light-rain":             return "небольшой дождь"
        case "rain":                   return "дождь"
        case "moderate-rain":          return "умеренно сильный дождь"
        case "heavy-rain":             return "сильный дождь"
        case "continuous-heavy-rain":  return "длительный сильный дождь"
        case "showers":                return "ливень"
        case "wet-snow":               return "дождь со снегом"
        case "light-snow":             return "небольшой снег"
        case "snow":                   return "снег"
        case "snow-showers":           return "снегопад"
        case "hail":                   return "град"
        case "thunderstorm":           return "гроза"
        case "thunderstorm-with-rain": return "дождь с грозой"
        case "thunderstorm-with-hail": return "гроза с градом"

        default: return "Загрузка..."

        }
    }

    init?(weatherData: WeatherData) {
        url = weatherData.info.url
        temperature = weatherData.fact.temp
        iconCondition = weatherData.fact.icon
        condition = weatherData.fact.condition
        pressureMm = weatherData.fact.pressureMm
        windSpeed = weatherData.fact.windSpeed
        tempMin = weatherData.forecasts.first!.parts.day.tempMin ?? 0
        tempMax = weatherData.forecasts.first!.parts.day.tempMax ?? 0
    }

    init() {}

}
