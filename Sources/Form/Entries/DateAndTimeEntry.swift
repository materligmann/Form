//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 28/11/2021.
//

import Foundation

// MARK: DateAndTimeEntry

public struct DateAndTimeEntry {
    let onDateChangedAction: (Date) -> Void
    
    public init(onDateChangedAction: @escaping (Date) -> Void) {
        self.onDateChangedAction = onDateChangedAction
    }
}
