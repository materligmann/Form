//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 09/10/2023.
//

import UIKit

public class ImageButtonCell: UITableViewCell {
    
    public class var cellIdentifier: String {
        return "ImageButtonCell"
    }
    
    private let descriptionLabel = UILabel()
    private let button = UIButton()
    private let activityIndicator = UIActivityIndicatorView()
    private let buttonImageView = UIImageView()
    private let label = UILabel()
    
    private var color: UIColor?
    private var disabledColor: UIColor?
    
    private var buttonAction: (() -> Void)?
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLabel()
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
        if entry.enabled {
            button.isEnabled = true
            backgroundColor = color
        } else {
            button.isEnabled = false
            backgroundColor = disabledColor
        }
        buttonImageView.tintColor = entry.tintColor
        label.font = entry.font
        label.text = entry.title
        label.textColor = entry.tintColor
        if (entry.border) {
            contentView.layer.borderWidth = 2
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
    private func configureLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
    }
    
    private func configureButtonImageView() {
        buttonImageView.contentMode = .scaleAspectFit
        buttonImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(buttonImageView)
        buttonImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        buttonImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        buttonImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        buttonImageView.rightAnchor.constraint(equalTo: label.leftAnchor, constant: -10).isActive = true
    }
    
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
        } else {
            button.isEnabled = false
            button.backgroundColor = disabledColor
        }
    }
    
    // MARK: User Action
    
    @objc private func onPress() {
        buttonAction?()
    }
}
