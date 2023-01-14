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
    
    public init(numberOfNotification: Int, text: String) {
        self.numberOfNotification = numberOfNotification
        self.text = text
    }
}
