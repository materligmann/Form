//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 25/12/2021.
//

import Foundation
import UIKit

public struct ImageEntry {
    let image: UIImage?
    let url: URL?
    let height: Int
    let placeholder: String?
    
    public init(image: UIImage?,
         url: URL?,
         height: Int,
         placeholder: String?) {
        self.image = image
        self.url = url
        self.height = height
        self.placeholder = placeholder
    }
}
