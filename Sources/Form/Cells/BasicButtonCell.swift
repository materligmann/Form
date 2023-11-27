//
//  BasicButtonCell.swift
//  iOS-Leaderboard
//
//  Created by Mathias Erligmann on 28/03/2021.
//

import UIKit

public class BasicButtonCell: UITableViewCell {
    
    public class var cellIdentifier: String {
        return "BasicButtonCell"
    }
    
    private let descriptionLabel = UILabel()
    private let button = UIButton()
    private let activityIndicator = UIActivityIndicatorView()
    
    private var color: UIColor?
    private var disabledColor: UIColor?
    private var myTintColor: UIColor?
    
    private var buttonAction: (() -> Void)?
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureButton()
        configureActivity()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set
    
    public func set(entry: BasicButtonEntry) {
        self.color = entry.color
        self.disabledColor = entry.disabledColor
        self.myTintColor = entry.tintColor
        if entry.enabled {
            button.isEnabled = true
            button.backgroundColor = color
        } else {
            button.isEnabled = false
            button.backgroundColor = disabledColor
        }
        backgroundColor = .clear
        button.tintColor = entry.tintColor
        button.imageView?.tintColor = entry.tintColor
        button.titleLabel?.font = entry.font
        button.setTitle(entry.title, for: .normal)
        button.setTitleColor(entry.tintColor, for: .normal)
        button.setTitleColor(.backColor, for: .highlighted)
        if (entry.border) {
            contentView.layer.borderWidth = 1
            contentView.layer.cornerRadius = 12
        }
        buttonAction = entry.onPress
        button.tintColor = .mainColor
        
        if entry.loading {
            activityIndicator.startAnimating()
        }
        
        switch entry.image {
        case .system(let str):
            button.setImage(UIImage(systemName: str), for: .normal)
        case .image(let str):
            button.setImage(UIImage(named: str), for: .normal)
        case .url(_):
            break
        case .none:
            break
        }
    }
    
    // MARK: Configure
    
    private func configureButton() {
        button.addTarget(self, action: #selector(onPress), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(button)
        button.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        button.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    private func configureActivity() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
    }
    
    public func enable(enabled: Bool) {
        if enabled {
            button.isEnabled = true
            button.backgroundColor = color
            button.setTitleColor(.white, for: .normal)
        } else {
            button.isEnabled = false
            button.backgroundColor = disabledColor
            button.setTitleColor(self.myTintColor, for: .normal)
        }
    }
    
    // MARK: User Action
    
    @objc private func onPress() {
        buttonAction?()
    }
}
