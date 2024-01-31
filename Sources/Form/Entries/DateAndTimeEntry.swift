//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 28/11/2021.
//

import UIKit

// MARK: DateAndTimeEntry

public struct DateAndTimeEntry {
    let onDateChangedAction: (Date) -> Void
    let pickerMode: UIDatePicker.Mode
    let date: Date?
    let minimumDate: Date?
    let maximumDate: Date?
    let description: String?
    let iconColor: UIColor?
    
    public init(onDateChangedAction: @escaping (Date) -> Void, datePickerMode: UIDatePicker.Mode,date: Date?, minimumDate: Date?, maximumDate: Date?, description: String?, iconColor: UIColor?) {
        self.onDateChangedAction = onDateChangedAction
        self.pickerMode = datePickerMode
        self.minimumDate = minimumDate
        self.maximumDate = maximumDate
        self.date = date
        self.description = description
        self.iconColor = iconColor
    }
}
