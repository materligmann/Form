//
//  FormTextInputCell.swift
//  GoGo
//
//  Created by Mathias Erligmann on 24/11/2020.
//

import UIKit

public class TextInputCell: UITableViewCell {
    
    private let textField = UITextField()
    private var onTextFieldChange: ((String?) -> Void)?
    
    public class var cellIdentifier: String {
        return "TextInputCell"
    }
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureBackground()
        configureTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set
    
    func set(entry: TextInputEntry) {
        self.onTextFieldChange = entry.onChange
        textField.keyboardType = entry.keyboardType ?? .alphabet
        textField.text = entry.defaultText
        textField.attributedPlaceholder = NSAttributedString(
            string: entry.placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
    }
    
    // MARK: Configure
    
    private func configureBackground() {
        contentView.backgroundColor = .backColor
    }
    
    private func configureTextField() {
        textField.keyboardType = .alphabet
        textField.autocorrectionType = .no
        textField.textColor = .mainColor
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(textField)
        textField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        textField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    // MARK: User Action
    
    @objc private func textFieldDidChange() {
        onTextFieldChange?(textField.text)
    }
    
    func dismissKeyboard() {
        textField.resignFirstResponder()
    }
}
