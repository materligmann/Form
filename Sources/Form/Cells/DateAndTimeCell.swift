//
//  DateAndTimeEntry.swift
//  Pylone
//
//  Created by Mathias Erligmann on 27/06/2021.
//

import UIKit

public class DateAndTimeCell: UITableViewCell {
    
    private let placeholderLabel = UILabel()
    private let valueLabel = UILabel()
    private let picker = UIDatePicker()
    private let iconView = UIImageView()
    
    private var onDateChangedAction: ((Date) -> Void)?
    
    class var cellIdentifier: String {
        return "DateAndTimeCell"
    }
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureBackground()
        configureIcon()
        configureDatePicker()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set
    
    func set(entry: FormModels.DateAndTimeEntry) {
        self.onDateChangedAction = entry.onDateChangedAction
    }
    
    // MARK: Configure
    
    func configureBackground() {
        backgroundColor = .backColor
    }
    
    func configureIcon() {
        iconView.tintColor = .mainColor
        iconView.image = UIImage(systemName: "calendar.circle.fill")
        iconView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(iconView)
        iconView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        iconView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        iconView.widthAnchor.constraint(equalTo: iconView.heightAnchor, constant: 0).isActive = true
        iconView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
    }
    
    private func configureDatePicker() {
        picker.tintColor = .mainColor
        picker.addTarget(self, action: #selector(onDateChanged), for: .valueChanged)
        picker.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(picker)
        picker.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        picker.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 32).isActive = true
        picker.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
    }
    
    // MARK: User Action
    
    @objc private func onDateChanged() {
        self.onDateChangedAction?(picker.date)
    }
}
