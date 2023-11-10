//
//  WebModels.swift
//  Waiter
//
//  Created by Mathias Erligmann on 12/06/2023.
//

import Foundation

public enum WebModels {
    public struct Request {
        public let url: String
        
        public init(url: String) {
            self.url = url
        }
    }
}
