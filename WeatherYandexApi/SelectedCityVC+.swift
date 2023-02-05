//
//  SelectedCityVC+.swift
//  WeatherYandexApi
//
//  Created by Александр Борисов on 02.02.2023.
//

import UIKit

extension SelectedCityViewController {

    func refreshLabels() {
        cityNameLabel.text = weatherModel?.name

        DispatchQueue.main.async {
            // так как Яндекс присылает карртинку в формате .svg, который Xcode не умеет читать, устанавливаем библиотеку SwiftSVG и работаем с ней.
            // создаем url из строки, указанной на сайте в примерах ответа сервера
            let url = URL(string: "https://yastatic.net/weather/i/icons/funky/dark/\(self.weatherModel!.iconCondition).svg")

            // получаем изображение - UIView(SVGURL: url!)
            let weatherImage = UIView(SVGURL: url!) { image in
                // делаем равным размер полученной view и нашей iconView
                image.resizeToFit(self.iconView.bounds)
            }
            // добавляем полученную view в нашу iconView
            self.iconView.addSubview(weatherImage)
        }

        conditionLabel.text = weatherModel?.conditionTranslate
        tempLabel.text = weatherModel?.temperatureString
        tempNameLabel.text = "C"

        valueForPressureMmLabel.text = weatherModel?.pressureMmString
        valueForWindSpeedLabel.text = weatherModel?.windSpeedString
        valueForTempMinLabel.text = weatherModel?.tempMinString
        valueForTempMaxLabel.text = weatherModel?.tempMaxString

    }

}
