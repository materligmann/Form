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
    
    public init(title: String,
                backgroundColor: UIColor?) {
        self.title = title
        self.backgroundColor = backgroundColor
    }
}
