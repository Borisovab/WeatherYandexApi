//
//  SelectedCityViewController.swift
//  WeatherYandexApi
//
//  Created by Александр Борисов on 31.01.2023.
//

import UIKit
import SwiftSVG

class SelectedCityViewController: UIViewController {

    var weatherModel: Weather?

    var cityNameLabel: UILabel = {
        let label = UILabel()
        label.font = Singleton.shared.fontOfSize30Medium
        label.textAlignment = .center
        return label
    }()

    var iconView: UIView = {
        let icon = UIView()
        return icon
    }()

    var conditionLabel: UILabel = {
        let label = UILabel()
        label.font = Singleton.shared.fontOfSize20Medium
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    var tempLabel: UILabel = {
        let label = UILabel()
        label.font = Singleton.shared.fontOfSize40Medium
        label.textAlignment = .right
        return label
    }()

    var tempNameLabel: UILabel = {
        let label = UILabel()
        label.font = Singleton.shared.fontOfSize40Medium
        label.textAlignment = .left
        label.text = "C"
        return label
    }()

    //MARK: - стек для (tempLabel и tempNameLabel)
    lazy var stackInsideTopStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = Singleton.StackSpacing.stackInsideTopStack.rawValue

        [tempLabel, tempNameLabel].forEach{ box in
            stack.addArrangedSubview(box)
        }
        return stack
    }()

    //MARK: - стек для (cityNameLabel, iconImage, conditionLabel и stackInsideTopStack)
    lazy var stackOnTheTopCide: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = Singleton.StackSpacing.stackOnTheTopCide.rawValue

        [cityNameLabel, iconView, conditionLabel, stackInsideTopStack].forEach{ box in
            stack.addArrangedSubview(box)
        }
        return stack
    }()

    var pressureMmLabel: UILabel = {
        let label = UILabel()
        label.text = Singleton.SelectedCityVCStringNames.pressureMmLabel.rawValue
        label.textAlignment = .left
        return label
    }()

    var windSpeedLabel: UILabel = {
        let label = UILabel()
        label.text = Singleton.SelectedCityVCStringNames.windSpeedLabel.rawValue
        label.textAlignment = .left
        return label
    }()

    var tempMinLabel: UILabel = {
        let label = UILabel()
        label.text = Singleton.SelectedCityVCStringNames.tempMinLabel.rawValue
        label.textAlignment = .left
        return label
    }()

    var tempMaxLabel: UILabel = {
        let label = UILabel()
        label.text = Singleton.SelectedCityVCStringNames.tempMaxLabel.rawValue
        label.textAlignment = .left
        return label
    }()

    //MARK: - стек для (pressureMmLabel, windSpeedLabel, tempMinLabel, tempMaxLabel)
    lazy var stackOnTheLeftBottomCide: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = Singleton.StackSpacing.stackOnTheBottomCide.rawValue

        [pressureMmLabel, windSpeedLabel, tempMinLabel, tempMaxLabel].forEach{ box in
            stack.addArrangedSubview(box)
        }
        return stack
    }()

    var valueForPressureMmLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()

    var valueForWindSpeedLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()

    var valueForTempMinLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()

    var valueForTempMaxLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()

    //MARK: - стек для (valueForPressureMmLabel, valueForWindSpeedLabel, valueForTempMinLabel, valueForTempMaxLabel)
    lazy var stackOnTheRightBottomCide: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = Singleton.StackSpacing.stackOnTheBottomCide.rawValue

        [valueForPressureMmLabel, valueForWindSpeedLabel, valueForTempMinLabel, valueForTempMaxLabel].forEach{ box in
            stack.addArrangedSubview(box)
        }
        return stack
    }()

    //MARK: - стек для (stackOnTheLeftBottomCide и stackOnTheRightBottomCide)
    lazy var commonBottomStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = Singleton.StackSpacing.commonBottomStack.rawValue

        [stackOnTheLeftBottomCide, stackOnTheRightBottomCide].forEach{ box in
            stack.addArrangedSubview(box)
        }
        return stack
    }()

    convenience init(weather: Weather) {
        self.init(nibName: nil, bundle: nil)
        self.weatherModel = weather

        refreshLabels()
    }

    private override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
    }

}
