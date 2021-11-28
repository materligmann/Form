//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 28/11/2021.
//

import UIKit

// MARK: TextInput

public struct TextInputEntry {
    let defaultText: String?
    let placeholder: String
    let onChange: (String?) -> Void
    var keyboardType: UIKeyboardType? = .alphabet
    
    
    public init(defaultText: String?,
                placeholder: String,
                onChange: @escaping (String?) -> Void,
                keyboardType: UIKeyboardType? = .alphabet) {
        self.defaultText = defaultText
        self.placeholder = placeholder
        self.onChange = onChange
        self.keyboardType = keyboardType
    }
}
