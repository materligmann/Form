//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 27/08/2024.
//

import UIKit

public struct TextViewEntry {
    let text: String?
    let placeholder: String?
    let change: ((String?) -> Void)?
    let background: UIColor
    
    public init(text: String?, placeholder: String?, change: ((String?) -> Void)?, background: UIColor) {
        self.text = text
        self.placeholder = placeholder
        self.change = change
        self.background = background
    }
}
