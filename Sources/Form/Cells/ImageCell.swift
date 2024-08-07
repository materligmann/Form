//
//  ImageCell.swift
//  KingsAndQueens
//
//  Created by Mathias Erligmann on 08/09/2021.
//

import Foundation


import UIKit

public class ImageCell: UITableViewCell {
    
    private let iconImageView = UIImageView()
    private let placeholderLabel = UILabel()
    
    private var placeholder: String?
    
    public class var cellIdentifier: String {
        return "ImageCell"
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
    
     public func set(entry: ImageEntry) {
        if let color = entry.color {
            iconImageView.tintColor = color
        }
        if let qrString = entry.qrString {
            iconImageView.image = qrString.generateQRCodeFromString()
        } else if let url = entry.url {
            iconImageView.downloaded(from: url)
        }
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
        iconImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        iconImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
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
