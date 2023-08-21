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
    
    public class var cellIdentifier: String {
        return "BasicCell"
    }
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        backgroundColor = entry.color
        tintColor = entry.textColor
        textLabel?.text = entry.title
        
        accessoryType = entry.accesory
        
        switch entry.imageName {
        case .image(let name):
            imageView?.image = UIImage(named: name)
        case .system(let name):
            imageView?.image = UIImage(systemName: name)
            imageView?.tintColor = entry.imageColor
        case .url:
            break
        case .none:
            break
        }
    }
}
