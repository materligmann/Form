//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 03/02/2022.
//

import Foundation

class Persistance {
    static func register(key: String, value: Codable) {
        UserDefaults.standard.set(value, forKey: key)
    }
}
