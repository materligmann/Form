//
//  RightButtonCell.swift
//  iOS-Leaderboard
//
//  Created by Mathias Erligmann on 05/04/2021.
//

import UIKit

public class RightButtonCell: UITableViewCell {
    
    private let placeholderLabel = UILabel()
    private let valueLabel = UILabel()
    private var action: (() -> Void)?
    
    public class var cellIdentifier: String {
        return "RightButtonCell"
    }
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set
    
    func set(entry: FormModels.RightButtonEntry) {
        textLabel?.text = entry.title
        self.action = entry.onPress
    }
    
    // MARK: Process
    
    func didSelect() {
        action?()
    }
    
    func removeSelection() {
        accessoryType = .none
    }
    
    func toggleSelection() {
        if accessoryType == .checkmark {
            accessoryType = .none
        } else {
            accessoryType = .checkmark
        }
    }
}
