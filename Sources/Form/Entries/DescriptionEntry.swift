//
//  DescriptionEntry.swift
//  Form
//
//  Created by Mathias Erligmann on 15/10/2024.
//

import UIKit

public struct DescriptionEntry {
    let description: String
    let backgroundColor: UIColor?
    
    public init(title: String,
                backgroundColor: UIColor?) {
        self.description = title
        self.backgroundColor = backgroundColor
    }
}
