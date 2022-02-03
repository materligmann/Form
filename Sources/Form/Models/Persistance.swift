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
    
    public static func get<T>(key: String) -> T? {
        if let obj = UserDefaults.standard.object(forKey: key) as? T {
            return obj
        }
        return nil
    }
    
}
