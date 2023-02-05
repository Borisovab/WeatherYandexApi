//
//  SelectedCityVCConstraintsSingleton.swift
//  WeatherYandexApi
//
//  Created by Александр Борисов on 02.02.2023.
//

import UIKit

class SelectedCityVCConstraintsSingleton {
    static let shared = SelectedCityVCConstraintsSingleton()
    private init(){}

    enum StackOnTheTopCide: Int {
        case topLeadingTrailing = 100
        case height = 300
    }

    enum CommonBottomStack: Int {
        case top = 50
        case leadingTrailing = 10
        case height = 150
    }

}
