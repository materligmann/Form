//
//  SliderCell.swift
//  KingsAndQueens
//
//  Created by Mathias Erligmann on 10/10/2021.
//

import UIKit

class SliderCell: UITableViewCell {
    
    private let slider = UISlider()
    
    class var cellIdentifier: String {
        return "SliderCell"
    }
    
    private var action: ((Float, Bool, Bool) -> Void)?
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .backColor
        selectionStyle = .none
        configureSlider()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set
    
    func set(entry: FormModels.SliderEntry) {
        action = entry.onSliderChange
        slider.minimumValue = Float(entry.minimum)
        slider.maximumValue = Float(entry.maximum)
        slider.setValue(Float(entry.initialValue), animated: false)
    }
    
    // MARK: Configure
    
    private func configureSlider() {
        slider.addTarget(self, action: #selector(onSliderChange), for: .valueChanged)
        slider.tintColor = .mainColor
        slider.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(slider)
        slider.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        slider.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        slider.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
    }
    
    // MARK: User Action
    
    @objc private func onSliderChange() {
        var max = false
        var min = false
        if slider.maximumValue == slider.value {
            max = true
        }
        if slider.minimumValue == slider.value {
            min = true
        }
        action?(slider.value, max, min)
    }
    
    
}
