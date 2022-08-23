//
//  RankingCell.swift
//  Rankings
//
//  Created by Mathias Erligmann on 23/08/2022.
//

import UIKit

public class RankingCell: UITableViewCell {
    
    private let rankingLabel = UILabel()
    private let valueLabel = UILabel()
    
    public class var cellIdentifier: String {
        return "RankingCell"
    }
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureRankingLabel()
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
        rankingLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        rankingLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
        rankingLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
    }
    
    func set(entry: RankingEntry) {
        rankingLabel.backgroundColor = entry.rankingColor
        rankingLabel.text = entry.ranking
    }
}
