//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 02/12/2021.
//

import UIKit

public struct TextEntry {
    let placeholder: String?
    let value: String?
    public var action: (()-> Void)?
    var accesory: UITableViewCell.AccessoryType = .none
    var supressable: Bool = false
    
    public init(placeholder: String?,
                value: String?,
                action: (()-> Void)?,
                accesory: UITableViewCell.AccessoryType,
                supressable: Bool = false) {
        self.placeholder = placeholder
        self.value = value
        self.action = action
        self.accesory = accesory
        self.supressable = supressable
    }
}
