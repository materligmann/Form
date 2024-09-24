//
//  TextViewCell.swift
//  jobs.paris
//
//  Created by Mathias Erligmann on 14/01/2024.
//

import UIKit

public class TextViewCell: UITableViewCell {
    
    private let textView = UITextView()
    private var onTextFieldChange: ((String?) -> Void)?
    
    var entry: TextViewEntry?
    
    public class var cellIdentifier: String {
        return "TextViewCell"
    }
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set
    
    public func set(entry: TextViewEntry) {
        self.entry = entry
        self.onTextFieldChange = entry.change
        textView.isEditable = entry.enable
        if let text = entry.text {
            textView.text = text
        } else {
            textView.text = entry.placeholder
            textView.textColor = .lightGray
        }
        textView.backgroundColor = entry.background
    }
    
    // MARK: Configure
    
    private func configureTextField() {
        textView.delegate = self
        textView.flashScrollIndicators()
        textView.layer.cornerRadius = 10
        textView.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(textView)
        textView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        textView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        textView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    // MARK: User Action
    
    @objc private func textFieldDidChange() {
        onTextFieldChange?(textView.text)
    }
    
    func dismissKeyboard() {
        textView.resignFirstResponder()
    }
}

extension TextViewCell: UITextViewDelegate {
    public func textViewDidChange(_ textView: UITextView) {
        onTextFieldChange?(textView.text)
    }
    
    public func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = .label
        }
    }
    
    public func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = entry?.placeholder
            textView.textColor = UIColor.lightGray
        }
    }
}
