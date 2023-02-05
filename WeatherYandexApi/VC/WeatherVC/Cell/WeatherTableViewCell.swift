//
//  WeatherTableViewCell.swift
//  WeatherYandexApi
//
//  Created by Александр Борисов on 31.01.2023.
//

import UIKit
import SnapKit

class WeatherTableViewCell: UITableViewCell {

    var nameLabel: UILabel = {
        let label = UILabel()
//        label.text = "Название"
        label.font = Singleton.shared.fontOfSize20Medium
        return label
    }()

    var statusLabel: UILabel = {
        let label = UILabel()
        label.font = Singleton.shared.fontOfSize14Light
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    var tempLabel: UILabel = {
        let label = UILabel()
        label.font = Singleton.shared.fontOfSize20Medium
        label.textAlignment = .right
        return label
    }()

    var tempNameLabel: UILabel = {
        let label = UILabel()
        label.font = Singleton.shared.fontOfSize20Medium
        label.textAlignment = .left
        return label
    }()

    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        statusLabel.text = nil
        tempLabel.text = nil
        tempNameLabel.text = nil
    }

    //MARK: - конфигуратор ячейки
    func configure(weather: Weather) {
        nameLabel.text = weather.name
        statusLabel.text = weather.conditionTranslate
        tempLabel.text = weather.temperatureString
        tempNameLabel.text = "C"

        setupCellConstraints()
    }

    //MARK: - Constraints
    private func setupCellConstraints() {
        [nameLabel, statusLabel, tempLabel, tempNameLabel].forEach{ box in
            contentView.addSubview(box)
        }

        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(WeatherCellConstraintsSingleton.NameLabel.height.rawValue)
            make.leading.equalToSuperview().offset(WeatherCellConstraintsSingleton.NameLabel.leading.rawValue)
            make.trailing.equalTo(statusLabel.snp.leading)
        }

        statusLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(WeatherCellConstraintsSingleton.StatusLabel.height.rawValue)
            make.trailing.equalTo(tempLabel.snp.leading)
            make.width.equalTo(WeatherCellConstraintsSingleton.StatusLabel.width.rawValue)
        }

        tempLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(WeatherCellConstraintsSingleton.TempLabel.height.rawValue)
            make.trailing.equalTo(tempNameLabel.snp.leading).offset(WeatherCellConstraintsSingleton.TempLabel.trailing.rawValue)
            make.width.equalTo(WeatherCellConstraintsSingleton.TempLabel.width.rawValue)
        }

        tempNameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(WeatherCellConstraintsSingleton.TempNameLabel.heightWidth.rawValue)
            make.trailing.equalToSuperview().offset(WeatherCellConstraintsSingleton.TempNameLabel.trailing.rawValue)
            make.width.equalTo(WeatherCellConstraintsSingleton.TempNameLabel.heightWidth.rawValue)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
