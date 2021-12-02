//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 02/12/2021.
//

import Foundation

public struct TextEntry {
    let placeholder: String?
    let value: String?
    var action: (()-> Void)?
    var disclosure: Bool = false
    
    public init(placeholder: String?,
                value: String?,
                action: (()-> Void)?,
                disclosure: Bool = false) {
        self.placeholder = placeholder
        self.value = value
        self.action = action
        self.disclosure = disclosure
    }
}
