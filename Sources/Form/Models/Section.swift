//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 25/11/2021.
//

import Foundation

public struct Section {
    let title: String?
    public var entries: [Entry]
    
    public init(title: String?, entries: [Entry]) {
        self.title = title
        self.entries = entries
    }
}
