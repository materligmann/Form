//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 12/10/2023.
//

import Foundation

public struct Argument {
    public let title: String
    public let argument: String
    public let image: BasicImage
    
    public init(title: String, argument: String, image: BasicImage) {
        self.title = title
        self.argument = argument
        self.image = image
    }
}
