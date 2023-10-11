//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 12/10/2023.
//

import Foundation

public struct Argument {
    let title: String
    let argument: String
    let image: BasicImage
    
    public init(title: String, argument: String, image: BasicImage) {
        self.title = title
        self.argument = argument
        self.image = image
    }
}
