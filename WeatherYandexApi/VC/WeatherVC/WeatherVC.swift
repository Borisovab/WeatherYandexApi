//
//  ViewController.swift
//  WeatherYandexApi
//
//  Created by Александр Борисов on 30.01.2023.
//

import UIKit

class WeatherVC: UIViewController {

    let weatherTableViewCellReuseIdentifier = "weatherTableViewCellReuseIdentifier"

    lazy var weatherTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: weatherTableViewCellReuseIdentifier)
        return tableView
    }()

    lazy var citySearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = Singleton.WeatherVCStringNames.searchBarPlaceholder.rawValue
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        return searchBar
    }()

    var emptyCity = Weather()
    var citiesArray = [Weather]()
    var sourseCitiesArray = [Weather]()

    var nameCitiesArray = Singleton.shared.startNameCitiesArray

    let networkAlamofireManager = NetworkAlamofireManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupWeatherVCConstraints()

        fillArrayEmptyCities()
        addCities()
    }
}

//MARK: - UISearchBarDelegate

extension WeatherVC: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        if searchText.isEmpty {
            citiesArray = sourseCitiesArray
        } else {
            citiesArray = sourseCitiesArray.filter{ city in
                city.name.lowercased().contains(searchText.lowercased())
            }
        }
        weatherTableView.reloadData()
    }
}


//MARK: - UITableViewDataSource
extension WeatherVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: weatherTableViewCellReuseIdentifier, for: indexPath) as? WeatherTableViewCell
        else { return UITableViewCell() }


        var weather = Weather()

        weather = citiesArray[indexPath.row]

        cell.configure(weather: weather)

        return cell
    }
}

//MARK: - UITableViewDelegate
extension WeatherVC: UITableViewDelegate {

    // удаление города из списка
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let deleteAction = UIContextualAction(style: .destructive,
                                              title: Singleton.WeatherVCStringNames.deleteAction.rawValue) { (_, _, completionHandler) in

            self.citiesArray.remove(at: indexPath.row)
            self.nameCitiesArray.remove(at: indexPath.row)

            tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

    // переход на SelectedCityViewController
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weather = citiesArray[indexPath.row]
        let vc = SelectedCityViewController(weather: weather)
        present(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
