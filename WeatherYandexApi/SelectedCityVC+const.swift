//
//  SelectedCityVC+const.swift
//  WeatherYandexApi
//
//  Created by Александр Борисов on 02.02.2023.
//

import UIKit
import SnapKit

extension SelectedCityViewController {

    func setupConstraints() {
        [stackOnTheTopCide, commonBottomStack].forEach{ box in
            view.addSubview(box)
        }

        stackOnTheTopCide.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(SelectedCityVCConstraintsSingleton.StackOnTheTopCide.topLeadingTrailing.rawValue)
            make.leading.trailing.equalToSuperview().inset(SelectedCityVCConstraintsSingleton.StackOnTheTopCide.topLeadingTrailing.rawValue)
            make.height.equalTo(SelectedCityVCConstraintsSingleton.StackOnTheTopCide.height.rawValue)
        }

        commonBottomStack.snp.makeConstraints { make in
            make.top.equalTo(stackOnTheTopCide.snp.bottom).offset(SelectedCityVCConstraintsSingleton.CommonBottomStack.top.rawValue)
            make.leading.trailing.equalToSuperview().inset(SelectedCityVCConstraintsSingleton.CommonBottomStack.leadingTrailing.rawValue)
            make.height.equalTo(SelectedCityVCConstraintsSingleton.CommonBottomStack.height.rawValue)
        }
    }
    
}



