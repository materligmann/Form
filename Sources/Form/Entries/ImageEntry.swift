//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 25/12/2021.
//

import Foundation
import UIKit

public struct ImageEntry {
    public let qrString: String?
    public let height: CGFloat
    public let placeholder: String?
    public let color: UIColor?
    public let image: BasicImage?
    public let backgroundColor: UIColor?
    public let lightBackgroundQr: Bool?
    
    public init(qrString: String?,
                height: CGFloat,
                placeholder: String?,
                color: UIColor?,
                image: BasicImage?,
                backgroundColor: UIColor?,
                lightBackgroundQr: Bool?) {
        self.qrString = qrString
        self.height = height
        self.placeholder = placeholder
        self.color = color
        self.image = image
        self.backgroundColor = backgroundColor
        self.lightBackgroundQr = lightBackgroundQr
    }
}
