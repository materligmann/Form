//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 14/01/2023.
//

import Foundation

public struct NotificationEntry {
    let numberOfNotification: Int
    let text: String
    let action: () -> Void
    
    public init(numberOfNotification: Int, text: String, action: @escaping () -> Void) {
        self.numberOfNotification = numberOfNotification
        self.text = text
        self.action = action
    }
}
