//
//  DetailCell.swift
//  mishkan-ios
//
//  Created by Mathias Erligmann on 01/12/2024.
//

import UIKit

public class DetailCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    private let detailLabel = UILabel()
    private let iconImageView = UIImageView()
    
    class var cellIdentifier: String {
        return "DetailCell"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        configureIconImageView()
        configureTitleLabel()
        configureDetailLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set
    
    public func set(entry: DetailEntry) {
        titleLabel.text = entry.title
        detailLabel.text = entry.text
        iconImageView.tintColor = entry.tintColor
        titleLabel.textColor = entry.tintColor
        
        switch entry.image {
        case .image(let name):
            iconImageView.image = UIImage(named: name)
        case .system(let name):
            iconImageView.image = UIImage(systemName: name)
        case .url(let url):
            if let url = URL(string: url) {
                iconImageView.downloaded(from: url)
            }
        case .none:
            break
        case .uiimage(let image):
            iconImageView.image = image
        }
    }
    
    // MARK: Configure
    
    private func configureIconImageView() {
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(iconImageView)
        iconImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        iconImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
    }
    
    private func configureTitleLabel() {
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 10).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func configureDetailLabel() {
        detailLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        detailLabel.textColor = .lightGray
        detailLabel.textAlignment = .right
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(detailLabel)
        detailLabel.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 15).isActive = true
        detailLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        detailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        detailLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
    }
}
