//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 12/10/2023.
//

import UIKit

class ArgumentCell: UITableViewCell {
    
    private let iconImageView = UIImageView()
    private let argumentLabel = UILabel()
    
    class var cellIdentifier: String {
        return "ArgumentCell"
    }
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureIcon()
        configureArgumentLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set
    
    func set(entry: ArgumentEntry) {
        switch entry.image {
        case .image(let name):
            iconImageView.image = UIImage(named: name)
        case .url(_):
            break
        case.none:
            break
        case .system(let name):
            iconImageView.image = UIImage(systemName: name)
        }
        argumentLabel.text = entry.argument
    }
    
    // MARK: Configure
    
    private func configureIcon() {
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .black
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(iconImageView)
        iconImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        iconImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 32).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
    }
    
    private func configureArgumentLabel() {
        argumentLabel.textAlignment = .left
        argumentLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        argumentLabel.numberOfLines = 0
        argumentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(argumentLabel)
        argumentLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 20).isActive = true
        argumentLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        argumentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        argumentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
}
