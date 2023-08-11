//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 28/11/2021.
//

import UIKit

// MARK: BasicButtonEntry

public struct BasicButtonEntry {
    let loading: Bool
    let title: String?
    let color: UIColor
    let tintColor: UIColor
    let onPress: (() -> Void)?
    let font: UIFont?
    let imageName: String?
    let disabledColor: UIColor
    let enabled: Bool
    
    public init(loading: Bool,
                title: String?,
                color: UIColor,
                tintColor: UIColor,
                onPress: (() -> Void)?,
                font: UIFont?,
                imageName: String?,
                disabledColor: UIColor,
                enabled: Bool) {
        self.loading = loading
        self.title = title
        self.color = color
        self.tintColor = tintColor
        self.onPress = onPress
        self.font = font
        self.imageName = imageName
        self.disabledColor = disabledColor
        self.enabled = enabled
    }
}
