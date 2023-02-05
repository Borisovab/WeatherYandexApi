//
//  AddNewCity.swift
//  WeatherYandexApi
//
//  Created by Александр Борисов on 02.02.2023.
//

import UIKit

extension UIViewController {

    func alertAddNewCity(name: String, placeholder: String, completionHandler: @escaping (String) -> Void) {

        let alert = UIAlertController(title: name,
                                      message: nil,
                                      preferredStyle: .alert)

        let okAction = UIAlertAction(title: Singleton.WeatherVCStringNames.alertActionOk.rawValue, style: .default) { action in

            let textTF = alert.textFields?.first

            guard let text = textTF?.text
            else { return }

            completionHandler(text)
        }

        alert.addTextField { textField in
            textField.placeholder = placeholder
        }

        let cancelAction = UIAlertAction(title: Singleton.WeatherVCStringNames.alertActionCancel.rawValue, style: .default)

        alert.addAction(okAction)
        alert.addAction(cancelAction)

        present(alert, animated: true)
    }
}
