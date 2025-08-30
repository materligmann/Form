//
//  DetailEntry.swift
//  Form
//
//  Created by Mathias Erligmann on 21/12/2024.
//

import UIKit

public struct DetailEntry {
    public let title: String
    public let text: String?
    public let image: BasicImage
    public let onAction: (() -> Void)?
    public let tintColor: UIColor
    public let font: UIFont
    
    public init(title: String, text: String?, image: BasicImage, onAction: (() -> Void)?, tintColor: UIColor, font: UIFont = UIFont.systemFont(ofSize: 15, weight: .regular)) {
        self.title = title
        self.text = text
        self.image = image
        self.onAction = onAction
        self.tintColor = tintColor
        self.font = font
    }
}
