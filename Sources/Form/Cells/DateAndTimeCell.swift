//
//  DateAndTimeEntry.swift
//  Pylone
//
//  Created by Mathias Erligmann on 27/06/2021.
//

import UIKit

public class DateAndTimeCell: UITableViewCell {
    
    private let descriptionLabel = UILabel()
    private let picker = UIDatePicker()
    private let iconView = UIImageView()
    
    private var onDateChangedAction: ((Date) -> Void)?
    
    public class var cellIdentifier: String {
        return "DateAndTimeCell"
    }
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureBackground()
        configureIcon()
        configureDatePicker()
        configureDescriptionLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set
    
    public func set(entry: DateAndTimeEntry) {
        self.onDateChangedAction = entry.onDateChangedAction
        picker.datePickerMode = entry.pickerMode
        if let date = entry.date {
            picker.date = date
        }
        picker.maximumDate = entry.maximumDate
        picker.minimumDate = entry.minimumDate
        descriptionLabel.text = entry.description
        iconView.tintColor = entry.iconColor
        picker.tintColor = entry.iconColor
    }
    
    // MARK: Configure
    
    private func configureBackground() {
        backgroundColor = .white
    }
    
    private func configureIcon() {
        iconView.image = UIImage(systemName: "calendar.circle.fill")
        iconView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(iconView)
        iconView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        iconView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        iconView.widthAnchor.constraint(equalTo: iconView.heightAnchor, constant: 0).isActive = true
        iconView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
    }
    
    private func configureDatePicker() {
        picker.addTarget(self, action: #selector(onDateChanged), for: .valueChanged)
        picker.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(picker)
        picker.widthAnchor.constraint(equalToConstant: 190).isActive = true
        picker.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        picker.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
    }
    
    private func configureDescriptionLabel() {
        descriptionLabel.font = UIFont.systemFont(ofSize: 11, weight: .bold)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLabel)
        descriptionLabel.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 10).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: picker.leftAnchor, constant: 0).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    // MARK: User Action
    
    @objc private func onDateChanged() {
        self.onDateChangedAction?(picker.date)
    }
}
