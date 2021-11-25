//
//  StepperCell.swift
//  KingsAndQueens
//
//  Created by Mathias Erligmann on 15/10/2021.
//

import UIKit

class StepperCell: UITableViewCell {
    
    private let stepper = UIStepper()
    private let valueLabel = UILabel()
    
    private var action: ((Double) -> Void)?
    
    class var cellIdentifier: String {
        return "StepperCell"
    }
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .backColor
        configureStepper()
        configureValueLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set
    
    func set(entry: FormModels.StepperEntry) {
        action = entry.onStepper
        stepper.minimumValue = entry.minimum
        stepper.maximumValue = entry.maximum
        stepper.value = entry.number
        if entry.disclosure {
            accessoryType = .disclosureIndicator
        }
    }
    
    // MARK: Configure
    
    private func configureStepper() {
        stepper.addTarget(self, action: #selector(onStepperChange), for: .valueChanged)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stepper)
        stepper.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        stepper.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
    }
    
    private func configureValueLabel() {
        valueLabel.font = .valueFont
        valueLabel.textColor = .mainColor
        valueLabel.textAlignment = .right
        valueLabel.numberOfLines = 0
        valueLabel.adjustsFontSizeToFitWidth = true
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(valueLabel)
        valueLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        valueLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        valueLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        valueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    // MARK: User Action
    
    @objc private func onStepperChange() {
        action?(stepper.value)
    }
    
    // MARK: Display
    
    private func displayValue() {
        valueLabel.text = "\(stepper.value.avoidNotation)"
    }
}
