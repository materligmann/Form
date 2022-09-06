//
//  String+CameCase.swift
//  Chaud Devant! Free
//
//  Created by Mathias Erligmann on 30/12/2019.
//  Copyright © 2019 Mathias Erligmann. All rights reserved.
//

import Foundation

private let badChars = CharacterSet.alphanumerics.inverted

extension String {
    public var uppercasingFirst: String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    public var lowercasingFirst: String {
        return prefix(1).lowercased() + dropFirst()
    }
    
    public var camelized: String {
        guard !isEmpty else {
            return ""
        }
        
        let parts = self.components(separatedBy: badChars)
        
        let first = String(describing: parts.first!).lowercasingFirst
        let rest = parts.dropFirst().map({ $0.uppercasingFirst })
        
        return ([first] + rest).joined(separator: "")
    }
}
