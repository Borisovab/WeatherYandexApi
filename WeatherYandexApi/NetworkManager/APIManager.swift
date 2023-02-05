//
//  APIManager.swift
//  WeatherYandexApi
//
//  Created by Александр Борисов on 02.02.2023.
//

import UIKit
import Alamofire

class APIManager {
    class func headers() -> HTTPHeaders {

        let headers: HTTPHeaders = [
            Singleton.shared.headersForKey: Singleton.shared.apiKey
        ]

        return headers
    }
}
