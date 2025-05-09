//
//  TitleCell.swift
//  jobs.paris
//
//  Created by Mathias Erligmann on 11/01/2024.
//

import UIKit

public class TitleCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    
    public class var cellIdentifier: String {
        return "TitleCell"
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
    
    public func set(entry: TitleEntry) {
        titleLabel.text = entry.title
        titleLabel.textAlignment = entry.textAlignment
        backgroundColor = entry.backgroundColor
    }
    
    private func configureTitleLabel() {
        titleLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
}
