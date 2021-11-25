//
//  TransactionCell.swift
//  KingsAndQueens
//
//  Created by Mathias Erligmann on 20/08/2021.
//

import UIKit

class TransactionCell: UITableViewCell {
    
    private let descriptionLabel = UILabel()
    private let pointsLabel = UILabel()
    private let iconImageView = UIImageView()
    private let dateLabel = UILabel()
    
    class var cellIdentifier: String {
        return "TransactionCell"
    }
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureBackground()
        configureDateLabel()
        configureIconImageView()
        configurePointsLabel()
        configureDescriptionLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set
    
    func set(entry: FormModels.TransactionEntry) {
    }
    
    // MARK: Configure
    
    private func configureBackground() {
        backgroundColor = .backColor
    }
    
    private func configureDateLabel() {
        dateLabel.font = UIFont.boldSystemFont(ofSize: 13)
        dateLabel.textColor = .lightGray
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dateLabel)
        dateLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func configureIconImageView() {
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .mainColor
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(iconImageView)
        iconImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        iconImageView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    private func configurePointsLabel() {
        pointsLabel.textColor = .mainColor
        pointsLabel.textAlignment = .right
        pointsLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pointsLabel)
        pointsLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        pointsLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
    }
    
    private func configureDescriptionLabel() {
        descriptionLabel.textColor = .lightGray
        descriptionLabel.font = .placeholderFont
        descriptionLabel.numberOfLines = 2
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLabel)
        descriptionLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 16).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: iconImageView.topAnchor, constant: 0).isActive = true
    }
}
