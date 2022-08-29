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
    let action: (() -> Void)?
    let contentMode: UIView.ContentMode
    
    public init(image: UIImage?,
                contentMode: UIView.ContentMode,
                url: URL?,
                height: Int,
                placeholder: String?,
                color: UIColor?,
                action: (() -> Void)?) {
        self.image = image
        self.url = url
        self.height = height
        self.placeholder = placeholder
        self.color = color
        self.action = action
        self.contentMode = contentMode
    }
}
