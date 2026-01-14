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
    public let detailColor: UIColor?
    public let backgroundColor: UIColor?
    public let accesoryType: UITableViewCell.AccessoryType?
    
    public init(title: String, text: String?, image: BasicImage, onAction: (() -> Void)?, tintColor: UIColor, font: UIFont = UIFont.systemFont(ofSize: 15, weight: .regular), backgroundColor: UIColor? = nil, accesoryType: UITableViewCell.AccessoryType? = nil, detailColor: UIColor? = nil) {
        self.title = title
        self.text = text
        self.image = image
        self.onAction = onAction
        self.tintColor = tintColor
        self.font = font
        self.backgroundColor = backgroundColor
        self.accesoryType = accesoryType
        self.detailColor = detailColor
    }
}
