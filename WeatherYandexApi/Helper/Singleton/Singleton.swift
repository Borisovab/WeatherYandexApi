//
//  Singleton.swift
//  WeatherYandexApi
//
//  Created by Александр Борисов on 30.01.2023.
//

import UIKit

class Singleton {
    static let shared = Singleton()
    private init(){}

    let apiKey = "2e4e0246-1eb5-4c84-82be-ff7521f2f12c"
    let headersForKey = "X-Yandex-API-Key"

    var startNameCitiesArray = ["Москва", "Петербург", "Пенза", "Уфа", "Новосибирск", "Челябинск", "Омск", "Екатеринбург", "Томск", "Сочи"]


    let fontOfSize40Medium = UIFont.systemFont(ofSize: 40, weight: .medium)
    let fontOfSize30Medium = UIFont.systemFont(ofSize: 30, weight: .medium)
    let fontOfSize20Medium = UIFont.systemFont(ofSize: 20, weight: .medium)
    let fontOfSize14Light = UIFont.systemFont(ofSize: 14, weight: .light)


    enum StackSpacing: Double {
        case stackInsideTopStack = 10.0
        case stackOnTheTopCide = 35.0
        case stackOnTheBottomCide = 20.0
        case commonBottomStack = 50.0
    }

    enum WeatherVCStringNames: String {
        case searchBarPlaceholder = "Search..."
        case deleteAction = "Удалить"
        case navigationItemTitle = "Список городов"
        case alertName = "Город"
        case alertPlaceholder = "Введите название города"
        case alertActionOk = "Ok"
        case alertActionCancel = "Отмена"
    }

    enum SelectedCityVCStringNames: String {
        case pressureMmLabel = "Давление:"
        case windSpeedLabel = "Скорость ветра:"
        case tempMinLabel = "Min температура днем:"
        case tempMaxLabel = "Max температура днем:"

    }
}
