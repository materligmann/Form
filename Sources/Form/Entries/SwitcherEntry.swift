//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 13/11/2023.
//

import UIKit

public struct SwitcherEntry {
    public let title: String
    public let backgroundColor: UIColor
    public let imageColor: UIColor
    public let tintColor: UIColor
    public let imageName: BasicImage
    public let isOn: Bool
    public let onSwitchAction: ((Bool) -> Void)?
    public let font: UIFont
    public let enable: Bool
    public let textColor: UIColor
    
    public init(title: String, backgroundColor: UIColor, imageColor: UIColor, tintColor: UIColor, imageName: BasicImage, isOn: Bool, onSwitchAction: ((Bool) -> Void)?, font: UIFont, enable: Bool, textColor: UIColor) {
        self.title = title
        self.backgroundColor = backgroundColor
        self.imageColor = imageColor
        self.imageName = imageName
        self.tintColor = tintColor
        self.isOn = isOn
        self.onSwitchAction = onSwitchAction
        self.font = font
        self.enable = enable
        self.textColor = textColor
    }
}
