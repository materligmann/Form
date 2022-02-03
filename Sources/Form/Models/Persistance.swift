//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 03/02/2022.
//

import Foundation

public class Persistance {
    public static func register(key: String, value: Codable) {
        UserDefaults.standard.set(value, forKey: key)
    }
}
