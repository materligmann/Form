//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 28/01/2022.
//

import UIKit

public class TitleCell: UITableViewCell {
    
    private let valueLabel = UILabel()
    
    public class var cellIdentifier: String {
        return "TitleCell"
    }
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .backColor
        configureValueLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set
    
    func set(entry: TitleEntry) {
        valueLabel.text = entry.value
        if entry.disclosure {
            accessoryType = .disclosureIndicator
        }
    }
    
    // MARK: Configure
    
    private func configureValueLabel() {
        valueLabel.font = UIFont.systemFont(ofSize: 30, weight: .black)
        valueLabel.textColor = .mainColor
        valueLabel.textAlignment = .right
        valueLabel.lineBreakMode = .byTruncatingMiddle
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(valueLabel)
        valueLabel.leftAnchor.constraint(equalTo: contentView.rightAnchor, constant: 16).isActive = true
        valueLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        valueLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        valueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    func onCopy() {
        UIPasteboard.general.string = valueLabel.text
//        Explorer.main?.displayMessage(message: Message(title: "Copied", body: "", onCompletion: nil, actions: nil))
    }
    
    func setValue(_ value: String) {
        valueLabel.text = value
    }
}
