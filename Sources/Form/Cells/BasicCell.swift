//
//  BasicCell.swift
//  GoGo
//
//  Created by Mathias Erligmann on 08/12/2020.
//

import UIKit

public class BasicCell: UITableViewCell {
    
    private let placeholderLabel = UILabel()
    private let valueLabel = UILabel()
    private let imageIcon = UIImageView()
    
    public class var cellIdentifier: String {
        return "BasicCell"
    }
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureImageIcon()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set
    
    func setAccessory(accessory: UITableViewCell.AccessoryType) {
        accessoryType = accessory
    }
    
    public func set(entry: BasicEntry) {
        textLabel?.textColor = entry.textColor
        textLabel?.font = entry.font
        backgroundColor = entry.color
        tintColor = entry.textColor
        textLabel?.text = entry.title
        
        accessoryType = entry.accesory
        
        switch entry.imageName {
        case .image(let name):
            imageIcon.image = UIImage(named: name)
        case .system(let name):
            imageIcon.image = UIImage(systemName: name)
            imageIcon.tintColor = entry.imageColor
        case .url:
            break
        case .none:
            break
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
}
