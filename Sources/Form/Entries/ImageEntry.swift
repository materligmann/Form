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
    public let url: URL?
    public let height: Int
    public let placeholder: String?
    public let color: UIColor?
    
    public init(qrString: String?,
                url: URL?,
                height: Int,
                placeholder: String?,
                color: UIColor?) {
        self.qrString = qrString
        self.url = url
        self.height = height
        self.placeholder = placeholder
        self.color = color
    }
}
