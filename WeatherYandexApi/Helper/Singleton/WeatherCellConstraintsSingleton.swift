//
//  WeatherCellConstraintsSingleton.swift
//  WeatherYandexApi
//
//  Created by Александр Борисов on 02.02.2023.
//

import UIKit

class WeatherCellConstraintsSingleton {
    static let shared = WeatherCellConstraintsSingleton()
    private init(){}

    enum NameLabel: Int {
        case height = 40
        case leading = 10
    }

    enum StatusLabel: Int {
        case height = 40
        case width = 150
    }

    enum TempLabel: Int {
        case height = 40
        case trailing = -3
        case width = 50
    }

    enum TempNameLabel: Int {
        case heightWidth = 40
        case trailing = -10

    }
}
