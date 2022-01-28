//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 28/01/2022.
//

import Foundation

public struct TitleEntry {
    let value: String?
    var action: (()-> Void)?
    var disclosure: Bool = false
    
    public init(value: String?,
                action: (()-> Void)?,
                disclosure: Bool = false) {
        self.value = value
        self.action = action
        self.disclosure = disclosure
    }
}
