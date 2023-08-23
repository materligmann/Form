//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 25/12/2021.
//

import Foundation
import UIKit

public struct ImageEntry {
    public let image: UIImage?
    public let url: URL?
    public let height: Int
    public let placeholder: String?
    public let color: UIColor?
    
    public init(image: UIImage?,
                url: URL?,
                height: Int,
                placeholder: String?,
                color: UIColor?) {
        self.image = image
        self.url = url
        self.height = height
        self.placeholder = placeholder
        self.color = color
    }
}
