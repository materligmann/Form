//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 03/02/2022.
//

import Foundation

public class Persistance {
    public static func set<Codable>(key: String, value: Codable) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    public static func get<Codable>(key: String, value: Codable) -> Codable? {
        if let obj = UserDefaults.standard.object(forKey: key) as? Codable {
            return obj
        }
        return nil
    }
    
}
