//
//  NetworkAlamofireManager.swift
//  WeatherYandexApi
//
//  Created by Александр Борисов on 02.02.2023.
//

import UIKit
import Alamofire

struct NetworkAlamofireManager {

    func currentWeather(latitude: Double, longitude: Double, complition: @escaping (Weather) -> Void ) {
        let urlString = "https://api.weather.yandex.ru/v2/forecast?lat=\(latitude)&lon=\(longitude)"
        guard let url = URL(string: urlString)
        else { return }

        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: APIManager.headers(),
                   interceptor: nil).response { response in

            guard let data = response.data
            else { return }

            if let weather = self.parseJson(withData: data) {
                complition(weather)
            }
        }
    }

    func parseJson(withData data: Data) -> Weather? {
        let decoder = JSONDecoder()
        do {
            let weatherData = try decoder.decode(WeatherData.self, from: data)
            guard let weather = Weather(weatherData: weatherData)
            else { return nil }
            return weather

        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
