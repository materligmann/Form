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
    
    func set(entry: BasicButtonEntry) {
        backgroundColor = .clear
        button.tintColor = entry.tintColor
        button.imageView?.tintColor = entry.tintColor
        button.titleLabel?.font = entry.font
        button.backgroundColor = entry.color
        button.setTitle(entry.title, for: .normal)
        button.setTitleColor(entry.tintColor, for: .normal)
        button.setTitleColor(.backColor, for: .highlighted)
        buttonAction = entry.onPress
        button.tintColor = .mainColor
        
        if entry.loading {
            activityIndicator.startAnimating()
        }
        
        guard let imageName = entry.imageName else { return }
        button.setImage(UIImage(systemName: imageName), for: .normal)
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
    
    // MARK: User Action
    
    @objc private func onPress() {
        buttonAction?()
    }
}
