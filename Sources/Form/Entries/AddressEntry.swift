//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 25/12/2021.
//

import UIKit

struct AddressEntry {
    let withBlockie: Bool
    let value: String?
    let onAction: (() -> Void)?
    let buttonTitle: String?
    let buttonImage: String?
    let buttonWidth: CGFloat?
    var action: (()-> Void)?
    var accessory: UITableViewCell.AccessoryType
    var suppressable: Bool = false
    
    public init(withBlockie: Bool,
         value: String?,
         onAction: (() -> Void)?,
         buttonTitle: String?,
         buttonImage: String?,
         buttonWidth: CGFloat?,
         action: (()-> Void)?,
         accessory: UITableViewCell.AccessoryType,
         suppressable: Bool = false) {
        self.withBlockie = withBlockie
        self.value = value
        self.onAction = onAction
        self.buttonTitle = buttonTitle
        self.buttonImage = buttonImage
        self.buttonWidth = buttonWidth
        self.action = action
        self.accessory = accessory
        self.suppressable = suppressable
    }
}
