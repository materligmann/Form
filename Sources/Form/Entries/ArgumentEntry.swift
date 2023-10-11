//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 12/10/2023.
//

import Foundation

struct ArgumentEntry {
    let image: BasicImage
    let argument: String
    
    init(image: BasicImage, argument: String) {
        self.image = image
        self.argument = argument
    }
}
