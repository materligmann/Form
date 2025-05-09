//
//  TitleEntry.swift
//  Form
//
//  Created by Mathias Erligmann on 15/10/2024.
//

import UIKit

public struct TitleEntry {
    let title: String
    let backgroundColor: UIColor?
    let textAlignment: NSTextAlignment
    
    public init(title: String,
                backgroundColor: UIColor?, textAlignment: NSTextAlignment = .center) {
        self.title = title
        self.backgroundColor = backgroundColor
        self.textAlignment = textAlignment
    }
}
