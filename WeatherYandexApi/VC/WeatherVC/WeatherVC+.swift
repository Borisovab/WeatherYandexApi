//
//  WeatherVC+.swift
//  WeatherYandexApi
//
//  Created by Александр Борисов on 30.01.2023.
//

import UIKit
import CoreLocation

extension WeatherVC {

    //MARK: - установка NavigationBar
    func setupNavBar() {
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 50, width: self.view.frame.size.width, height: 164))
        view.addSubview(navBar)
        let navItem = UINavigationItem(title: Singleton.WeatherVCStringNames.navigationItemTitle.rawValue)
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: #selector(addNewCityToTheList))
        navItem.rightBarButtonItem = addButton
        navBar.setItems([navItem], animated: false)
    }

    //MARK: - добавляем город в имеющийся список городов
    @objc private func addNewCityToTheList() {
        alertAddNewCity(name: Singleton.WeatherVCStringNames.alertName.rawValue, placeholder: Singleton.WeatherVCStringNames.alertPlaceholder.rawValue) { city in
            self.nameCitiesArray.append(city.capitalized)
            self.citiesArray.append(self.emptyCity)
            self.addCities()
        }
    }

    //MARK: - метод для получения координат заданного города (lat, lon)
    func getCoordinateFrom(city: String, complition: @escaping (_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> Void) {
        CLGeocoder().geocodeAddressString(city) { placemark, error in
            complition(placemark?.first?.location?.coordinate, error)
        }
    }

    //MARK: - метод для заполнения массива citiesArray даными по индексу и городу из массива nameCitiesArray
    func getCityWeather(citiesArray: [String], complition: @escaping (Int, Weather) -> Void) {

        for (index, item) in citiesArray.enumerated() {
            getCoordinateFrom(city: item) { [weak self] (coordinate, error) in

                guard let coordinate = coordinate, error == nil
                else { return }

                guard let self = self
                else { return }

                self.networkAlamofireManager.currentWeather(latitude: coordinate.latitude, longitude: coordinate.longitude) { weather in
                    complition(index, weather)
                }
            }
        }
    }

    //MARK: - для того чтобы массив citiesArray заполнялся правильно по индексу и названию, создаем массив из пустых экземпляров, которые потом буду заполняться
    func fillArrayEmptyCities() {
        if citiesArray.isEmpty {
            citiesArray = Array(repeating: emptyCity, count: nameCitiesArray.count)
        }
    }

    //MARK: - заполняем массив citiesArray
    func addCities() {
        getCityWeather(citiesArray: self.nameCitiesArray) { [weak self] (index, weather) in
            guard let self = self
            else { return }

            self.citiesArray[index] = weather
            self.citiesArray[index].name = self.nameCitiesArray[index]

            DispatchQueue.main.async {

                self.weatherTableView.reloadData()
                self.sourseCitiesArray = self.citiesArray
            }
        }
    }
}
