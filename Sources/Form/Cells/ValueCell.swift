//
//  ValueCell.swift
//  KingsAndQueens
//
//  Created by Mathias Erligmann on 17/10/2021.
//

import UIKit

class ValueCell: UITableViewCell {
    
    private let textField = UITextField()
    private let symbolLabel = UILabel()
    private var onTextFieldChange: ((String?) -> Void)?
    
    class var cellIdentifier: String {
        return "ValueCell"
    }
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureBackground()
        configureSymbolLabel()
        configureTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set
    
    func set(entry: FormModels.ValueEntry) {
        self.onTextFieldChange = entry.onChange
        symbolLabel.text = entry.symbol
        symbolLabel.textColor = entry.textColor
        textField.isUserInteractionEnabled = entry.editable
        textField.textColor = entry.textColor
        textField.keyboardType = entry.keyboardType ?? .decimalPad
        textField.placeholder = entry.placeholder
        textField.text = entry.defaultText
    }
    
    // MARK: Configure
    
    private func configureBackground() {
        contentView.backgroundColor = .backColor
    }
    
    private func configureSymbolLabel() {
        symbolLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        symbolLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(symbolLabel)
        symbolLabel.widthAnchor.constraint(equalToConstant: 45).isActive = true
        symbolLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -32).isActive = true
        symbolLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        symbolLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    private func configureTextField() {
        textField.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        textField.keyboardType = .alphabet
        textField.textAlignment = .right
        textField.autocorrectionType = .no
        textField.textColor = .mainColor
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(textField)
        textField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        textField.rightAnchor.constraint(equalTo: symbolLabel.leftAnchor, constant: -10).isActive = true
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
