//
//  BasicCell.swift
//  GoGo
//
//  Created by Mathias Erligmann on 08/12/2020.
//

import UIKit

public class BasicCell: UITableViewCell {
    
    private let valueLabel = UILabel()
    private let imageIcon = UIImageView()
    
    public class var cellIdentifier: String {
        return "BasicCell"
    }
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureImageIcon()
        configureValueLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set
    
    func setAccessory(accessory: UITableViewCell.AccessoryType) {
        accessoryType = accessory
    }
    
    public func set(entry: BasicEntry) {
        valueLabel.textColor = entry.textColor
        valueLabel.font = entry.font
        backgroundColor = entry.color
        tintColor = entry.textColor
        valueLabel.text = entry.title
        
        accessoryType = entry.accesory
        
        switch entry.imageName {
        case .image(let name):
            imageIcon.image = UIImage(named: name)
        case .system(let name):
            imageIcon.image = UIImage(systemName: name)
            imageIcon.tintColor = entry.imageColor
        case .url(let url):
            if let url = URL(string: url) {
                imageIcon.downloaded(from: url)
            }
        case .none:
            break
        case .uiimage(let image):
            imageIcon.image = image
        }
    }
    
    private func configureImageIcon() {
        imageIcon.contentMode = .scaleAspectFit
        imageIcon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageIcon)
        imageIcon.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imageIcon.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageIcon.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        imageIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
    }
    
    private func configureValueLabel() {
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(valueLabel)
        valueLabel.leftAnchor.constraint(equalTo: imageIcon.rightAnchor, constant: 10).isActive = true
        valueLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        valueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        valueLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
    }
}
