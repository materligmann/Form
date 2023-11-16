//
//  SwitchCell.swift
//  GoGo
//
//  Created by Mathias Erligmann on 23/12/2020.
//

import UIKit

public class SwitcherCell: UITableViewCell {
    
    private let placeholderLabel = UILabel()
    private let valueLabel = UILabel()
    private let switcher = UISwitch()
    private let iconImageView = UIImageView()
    
    private var switcherAction: ((Bool) -> Void)?
    
    public class var cellIdentifier: String {
        return "SwitcherCell"
    }
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureSwitcher()
        configureImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set
    
    public func set(entry: SwitcherEntry) {
        backgroundColor = entry.backgroundColor
        switcherAction = entry.onSwitchAction
        switcher.onTintColor = entry.tintColor
        switcher.setOn(entry.isOn, animated: false)
        iconImageView.tintColor = entry.imageColor
        textLabel?.text = entry.title
        textLabel?.font = entry.font
        textLabel?.textColor = .mainColor
        switch entry.imageName {
        case .image(let name):
            iconImageView.image = UIImage(named: name)
        case .system(let name):
            iconImageView.image = UIImage(systemName: name)
        case .url:
            break
        case .none:
            break
        }
    }
    
    // MARK: Configure
    
    private func configureSwitcher() {
        switcher.addTarget(self, action: #selector(onSwitcherValueChanged), for: .valueChanged)
        switcher.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(switcher)
        switcher.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        switcher.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
    }
    
    private func configureImageView() {
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(iconImageView)
        iconImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
    }
    
    // MARK: User Action
    
    @objc private func onSwitcherValueChanged() {
        switcherAction?(switcher.isOn)
    }
    
    func setSwitch(active: Bool) {
        switcher.setOn(active, animated: true)
    }
}
