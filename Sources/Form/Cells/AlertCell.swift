//
//  AlertCell.swift
//  KingsAndQueens
//
//  Created by Mathias Erligmann on 21/11/2021.
//

import UIKit

public class AlertCell: UITableViewCell {
    
    private let placeholderLabel = UILabel()
    private let valueLabel = UILabel()
    private let rightButton = UIButton()
    
    private var rightAction: (() -> Void)?
    
    class var cellIdentifier: String {
        return "AlertCell"
    }
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set
    
    func set(entry: FormModels.AlertEntry) {
        textLabel?.textColor = entry.textColor
        backgroundColor = entry.color
        tintColor = entry.textColor
        selectionStyle = .none
        textLabel?.text = entry.alert.title
        
        if entry.alert.sticky {
            rightAction = entry.alert.action
            configureRightButton()
        }
        
        if entry.alert.loading {
            let loader = UIActivityIndicatorView()
            imageView?.addSubview(loader)
            loader.startAnimating()
        } else {
            switch entry.alert.image {
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
    
    private func configureRightButton() {
        rightButton.tintColor = .backColor
        rightButton.addTarget(self,
                              action: #selector(onRightButton),
                              for: .touchUpInside)
        rightButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(rightButton)
        rightButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        rightButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        rightButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        rightButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
    }
    
    // MARK: User Action
    
    @objc private func onRightButton() {
        rightAction?()
    }
}

