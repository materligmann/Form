//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 28/11/2021.
//

import UIKit

// MARK: BasicButtonEntry

public struct BasicButtonEntry {
    let border: Bool
    let loading: Bool
    let title: String?
    let color: UIColor
    let selectedTintColor: UIColor
    let disabledTintColor: UIColor
    let onPress: (() -> Void)?
    let font: UIFont?
    let image: BasicImage
    let disabledColor: UIColor
    let enabled: Bool
    
    public init(border: Bool,
                loading: Bool,
                title: String?,
                color: UIColor,
                selectedTintColor: UIColor,
                disabledTintColor: UIColor,
                onPress: (() -> Void)?,
                font: UIFont?,
                image: BasicImage,
                disabledColor: UIColor,
                enabled: Bool) {
        self.loading = loading
        self.title = title
        self.color = color
        self.selectedTintColor = selectedTintColor
        self.disabledTintColor = disabledTintColor
        self.onPress = onPress
        self.font = font
        self.image = image
        self.disabledColor = disabledColor
        self.enabled = enabled
        self.border = border
    }
}
