//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 12/10/2023.
//

import Foundation

public struct ArgumentEntry {
    let image: BasicImage
    let argument: String
    
    public init(image: BasicImage, argument: String) {
        self.image = image
        self.argument = argument
    }
}
