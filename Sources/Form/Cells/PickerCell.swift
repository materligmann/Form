//
//  PickerCell.swift
//  Pylone
//
//  Created by Mathias Erligmann on 27/06/2021.
//

import UIKit

public class PickerCell: UITableViewCell {
    
    private let placeholderLabel = UILabel()
    private let valueLabel = UILabel()
    private let picker = UIPickerView()
    private let iconView = UIImageView()
    private let textField = UITextField()
    
    private var components: [FormModels.Component]?
    
    private var onPick: ((String) -> Void)?
    
    class var cellIdentifier: String {
        return "PickerCell"
    }
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        picker.dataSource = self
        picker.delegate = self
        configureIcon()
        configureTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set
    
    func set(entry: FormModels.PickerEntry) {
        self.components = entry.components
        picker.reloadAllComponents()
        textField.text = components?[0].rows[0].title
        self.onPick = entry.onPick
    }
    
    // MARK: Configure
    
    func configureIcon() {
        iconView.image = UIImage(systemName: "person.circle.fill")
        iconView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(iconView)
        iconView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        iconView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        iconView.widthAnchor.constraint(equalTo: iconView.heightAnchor, constant: 0).isActive = true
        iconView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
    }
    
    private func configureTextField() {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 44))
        let doneBtn = UIBarButtonItem(title: "Select",
                                      style: UIBarButtonItem.Style.done,
                                      target: self,
                                      action: #selector(onSelect))
        
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,
                                    target: nil,
                                    action: nil)
        
        toolBar.setItems([space, doneBtn], animated: false)
        
        textField.tintColor = .clear
        textField.textAlignment = .right
        textField.delegate = self
        textField.inputAccessoryView = toolBar
        textField.inputView = picker
        textField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(textField)
        textField.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 16).isActive = true
        textField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    @objc func onSelect() {
        textField.resignFirstResponder()
    }
}

extension PickerCell: UIPickerViewDataSource, UIPickerViewDelegate {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return components?.count ?? 0
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return components?[component].rows.count ?? 0
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return components?[component].rows[row].title ?? ""
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = components?[component].rows[row].title
        onPick?(textField.text ?? "")
    }
}

extension PickerCell: UITextFieldDelegate {
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
}
