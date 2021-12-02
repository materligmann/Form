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
}
