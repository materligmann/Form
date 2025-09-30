//
//  BioModels.swift
//  mishkan-ios
//
//  Created by Mathias Erligmann on 27/11/2024.
//

enum WriteTextModels {
    struct Request {
        let text: String?
        let onDone: (String?) -> Void
        let placeholder: String
        let maxCharacters: Int
    }
}
