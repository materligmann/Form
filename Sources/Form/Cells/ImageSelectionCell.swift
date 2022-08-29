//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 29/08/2022.
//

import UIKit

public class ImageSelectionCell: UITableViewCell {
    
    private let iconImageView = UIImageView()
    private let placeholderLabel = UILabel()
    
    private var placeholder: String?
    
    public class var cellIdentifier: String {
        return "ImageSelectionCell"
    }
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureBackground()
        configureIconImageView()
        configurePlaceholderLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set
    
    func set(entry: ImageSelectionEntry) {
        if let color = entry.color {
            iconImageView.tintColor = color
        }
        if let image = entry.image {
            iconImageView.image = image
        } else if let url = entry.url {
            iconImageView.downloaded(from: url)
        }
        iconImageView.contentMode = entry.contentMode
        placeholder = entry.placeholder
        placeholderLabel.text = placeholder
    }
    
    // MARK: Configure
    
    private func configureBackground() {
        backgroundColor = .backColor
    }
    
    private func configureIconImageView() {
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(iconImageView)
        iconImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        iconImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -0).isActive = true
        iconImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    }
    
    private func configurePlaceholderLabel() {
        placeholderLabel.textColor = .lightGray
        placeholderLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(placeholderLabel)
        placeholderLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        placeholderLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
    }
    
    // MARK: Display
    
    func displayImage(image: UIImage?) {
        iconImageView.image = image
        if image != nil {
            placeholderLabel.text = nil
        } else {
            placeholderLabel.text = placeholder
        }
    }
}
