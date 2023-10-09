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
    let minimumDate: Date?
    let maximumDate: Date?
    
    public init(onDateChangedAction: @escaping (Date) -> Void, datePickerMode: UIDatePicker.Mode, minimumDate: Date?, maximumDate: Date?) {
        self.onDateChangedAction = onDateChangedAction
        self.pickerMode = datePickerMode
        self.minimumDate = minimumDate
        self.maximumDate = maximumDate
    }
}
