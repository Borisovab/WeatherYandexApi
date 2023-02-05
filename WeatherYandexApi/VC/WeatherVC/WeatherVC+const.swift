//
//  WeatherVC+const.swift
//  WeatherYandexApi
//
//  Created by Александр Борисов on 31.01.2023.
//

import UIKit
import SnapKit

extension WeatherVC {

    func setupWeatherVCConstraints() {
        [citySearchBar, weatherTableView].forEach{ box in
            view.addSubview(box)
        }

        citySearchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(WeatherConstraintsSingleton.CitySearchBar.top.rawValue)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(WeatherConstraintsSingleton.CitySearchBar.height.rawValue)
        }

        weatherTableView.snp.makeConstraints { make in
            make.top.equalTo(citySearchBar.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(WeatherConstraintsSingleton.WeatherTableView.leadingTrailing.rawValue)
            make.bottom.equalToSuperview()
        }
    }
}
