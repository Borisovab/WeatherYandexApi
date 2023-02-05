//
//  WeatherConstraintsSingleton.swift
//  WeatherYandexApi
//
//  Created by Александр Борисов on 02.02.2023.
//

import UIKit


class WeatherConstraintsSingleton {
    static let shared = WeatherConstraintsSingleton()
    private init(){}

    enum CitySearchBar: Int {
        case top = 96
        case height = 40
    }

    enum WeatherTableView: Int {
        case leadingTrailing = 5
    }
}
