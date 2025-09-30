//
//  BioModels.swift
//  mishkan-ios
//
//  Created by Mathias Erligmann on 27/11/2024.
//

public enum WriteTextModels {
    public struct Request {
        let text: String?
        let onDone: (String?) -> Void
        let placeholder: String
        let maxCharacters: Int
        
        public init(text: String?, onDone: @escaping (String?) -> Void, placeholder: String, maxCharacters: Int) {
            self.text = text
            self.onDone = onDone
            self.placeholder = placeholder
            self.maxCharacters = maxCharacters
        }
    }
}
