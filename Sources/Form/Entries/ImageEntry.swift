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
    public let height: Int
    public let placeholder: String?
    public let color: UIColor?
    public let image: BasicImage?
    
    public init(qrString: String?,
                height: Int,
                placeholder: String?,
                color: UIColor?,
                image: BasicImage?) {
        self.qrString = qrString
        self.height = height
        self.placeholder = placeholder
        self.color = color
        self.image = image
    }
}
