//
//  RankingCell.swift
//  Rankings
//
//  Created by Mathias Erligmann on 23/08/2022.
//

import UIKit

public class RankingCell: UITableViewCell {
    
    private let rankingLabel = UILabel()
    private let nameLabel = UILabel()
    private let rankingIcon = UIImageView()
    
    public class var cellIdentifier: String {
        return "RankingCell"
    }
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureRankingLabel()
        configureRankingIcon()
        configureNameLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set
    
    private func configureRankingLabel() {
        rankingLabel.textAlignment = .center
        rankingLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        rankingLabel.textColor = .white
        rankingLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(rankingLabel)
        rankingLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        rankingLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        rankingLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        rankingLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
    }
    
    private func configureRankingIcon() {
        rankingIcon.tintColor = .darkText
        rankingIcon.image = UIImage(systemName: "line.3.horizontal")
        rankingIcon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(rankingIcon)
        rankingIcon.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        rankingIcon.heightAnchor.constraint(equalToConstant: 30).isActive = true
        rankingIcon.widthAnchor.constraint(equalToConstant: 30).isActive = true
        rankingIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
    }
    
    private func configureNameLabel() {
        nameLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        nameLabel.leftAnchor.constraint(equalTo: rankingLabel.rightAnchor, constant: 10).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rankingIcon.leftAnchor, constant: -10).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
    }
    
    func set(entry: RankingEntry) {
        rankingLabel.backgroundColor = entry.rankingColor
        rankingLabel.text = entry.ranking
        nameLabel.text = entry.name
    }
}
