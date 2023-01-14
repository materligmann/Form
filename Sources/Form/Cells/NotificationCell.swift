//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 14/01/2023.
//

import UIKit

public class NotificationCell: UITableViewCell {
    
    private let notificationImageView = UIImageView()
    private let valueLabel = UILabel()
    
    public class var cellIdentifier: String {
        return "NotificationCell"
    }
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        configureBackground()
        configureNotificationImageView()
        configureValueLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set
    
    func set(entry: NotificationEntry) {
        valueLabel.text = entry.text
        if entry.numberOfNotification == 0 {
            notificationImageView.isHidden = true
        } else {
            notificationImageView.isHidden = false
            notificationImageView.image = UIImage(systemName: "\(entry.numberOfNotification).circle.fill")
        }
    }
    
    // MARK: Configure
    
    private func configureBackground() {
        backgroundColor = .white
    }
    
    private func configureNotificationImageView() {
        notificationImageView.tintColor = .red
        notificationImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(notificationImageView)
        notificationImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        notificationImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        notificationImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        notificationImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
    }
    
    private func configureValueLabel() {
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(valueLabel)
        valueLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        valueLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        valueLabel.rightAnchor.constraint(equalTo: notificationImageView.leftAnchor, constant: -8).isActive = true
        valueLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
    }
    
}
