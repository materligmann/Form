//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 29/08/2022.
//

import UIKit

public struct ImageSelectionEntry {
    let image: UIImage?
    let url: URL?
    let height: Int
    let placeholder: String?
    let color: UIColor?
    
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
