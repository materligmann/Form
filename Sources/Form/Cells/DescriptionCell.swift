//
//  DescriptionCell.swift
//  jobs.paris
//
//  Created by Mathias Erligmann on 11/01/2024.
//

import UIKit

public class DescriptionCell: UITableViewCell {
    
    private let descriptionLabel = UILabel()
    
    public class var cellIdentifier: String {
        return "DescriptionCell"
    }
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set
    
    func setAccessory(accessory: UITableViewCell.AccessoryType) {
        accessoryType = accessory
    }
    
    public func set(description: String) {
        descriptionLabel.text = description
    }
    
    private func configureTitleLabel() {
        descriptionLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLabel)
        descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
}
