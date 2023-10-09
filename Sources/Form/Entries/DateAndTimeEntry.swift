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
    
    public init(onDateChangedAction: @escaping (Date) -> Void, datePickerMode: UIDatePicker.Mode) {
        self.onDateChangedAction = onDateChangedAction
        self.pickerMode = datePickerMode
    }
}
