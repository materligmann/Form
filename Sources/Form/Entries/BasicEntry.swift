//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 28/11/2021.
//

import UIKit

public struct BasicEntry {
    let title: String
    let imageName: BasicImage
    let action: (() -> Void)?
    let accesory: UITableViewCell.AccessoryType
    let color: UIColor
    let imageColor: UIColor
    let textColor: UIColor
    var supressable: Bool = false
    
    
    public init(title: String,
                imageName: BasicImage,
                action: (() -> Void)?,
                accesory: UITableViewCell.AccessoryType,
                color: UIColor,
                imageColor: UIColor,
                textColor: UIColor,
                supressable: Bool = false) {
        self.title = title
        self.imageName = imageName
        self.action = action
        self.accesory = accesory
        self.color = color
        self.imageColor = imageColor
        self.textColor = textColor
        self.supressable = supressable
    }
}
