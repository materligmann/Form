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
    public let imageName: BasicImage
    public let isOn: Bool
    public let onSwitchAction: ((Bool) -> Void)?
    
    public init(title: String, backgroundColor: UIColor, imageColor: UIColor, imageName: BasicImage, isOn: Bool, onSwitchAction: ((Bool) -> Void)?) {
        self.title = title
        self.backgroundColor = backgroundColor
        self.imageColor = imageColor
        self.imageName = imageName
        self.isOn = isOn
        self.onSwitchAction = onSwitchAction
    }
}
