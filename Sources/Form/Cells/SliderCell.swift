//
//  SliderCell.swift
//  KingsAndQueens
//
//  Created by Mathias Erligmann on 10/10/2021.
//

import UIKit

public class SliderCell: UITableViewCell {
    
    private let slider = UISlider()
    private let amountLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    private var int: Bool = false
    
    public class var cellIdentifier: String {
        return "SliderCell"
    }
    
    private var action: ((Float, Bool, Bool) -> Void)?
    
    // MARK: Lifecycle
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        action = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configureAmountLabel()
        configureDescriptionLabel()
        configureSlider()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set
    
    public func set(entry: SliderEntry) {
        action = entry.onSliderChange
        self.int = entry.int
        slider.isContinuous = entry.isContinuous
        slider.minimumValue = Float(entry.minimum)
        slider.maximumValue = Float(entry.maximum)
        slider.setValue(Float(entry.initialValue), animated: false)
        slider.tintColor = entry.tintColor
        amountLabel.text = String(entry.initialValue)
        descriptionLabel.text = entry.description
    }
    
    // MARK: Configure
    
    private func configureAmountLabel() {
        amountLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        amountLabel.textAlignment = .right
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(amountLabel)
        amountLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        amountLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        amountLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        amountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
    }
    
    private func configureDescriptionLabel() {
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLabel)
        descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: amountLabel.leftAnchor, constant: -10).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
    }
    
    private func configureSlider() {
        slider.addTarget(self, action: #selector(onSliderChange), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(slider)
        slider.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        slider.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        slider.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20).isActive = true
    }
    
    // MARK: User Action
    
    @objc private func onSliderChange() {
        if int {
            let intValue = round(slider.value) // <-- Round to nearest integer
            slider.setValue(intValue, animated: false) // <-- Force slider thumb to snap
            amountLabel.text = String(Int(intValue))
            
            let max = intValue == slider.maximumValue
            let min = intValue == slider.minimumValue
            
            action?(intValue, max, min)
        } else {
            var max = false
            var min = false
            if slider.maximumValue == slider.value {
                max = true
            }
            if slider.minimumValue == slider.value {
                min = true
            }
            amountLabel.text = String(slider.value)
            action?(slider.value, max, min)
        }
    }
    
    
}
