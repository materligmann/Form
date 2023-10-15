//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 15/10/2023.
//

import Foundation

public extension URL {
    var queryParameters: [String: String] {
        var params = [String: String]()
        if let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
           let queryItems = components.queryItems {
            for item in queryItems {
                if let value = item.value {
                    params[item.name] = value
                }
            }
        }
        return params
    }
}
