//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 12/10/2023.
//

import UIKit

public class SubtitleCell: UITableViewCell {
    
    private let subtitleLabel = UILabel()
    
    public class var cellIdentifier: String {
        return "SubtitleCell"
    }
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        configureSubtitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func set(subtitle: String) {
        subtitleLabel.text = subtitle
    }
    
    // MARK: Configure
    
    private func configureSubtitle() {
        subtitleLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(subtitleLabel)
        subtitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 32).isActive = true
        subtitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -32).isActive = true
        subtitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        subtitleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
    }
}
