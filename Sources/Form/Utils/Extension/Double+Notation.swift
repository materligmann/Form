//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 25/11/2021.
//

import Foundation

extension Double {
    var avoidNotation: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 8
        numberFormatter.maximumSignificantDigits = 8
        numberFormatter.decimalSeparator = "."
        return numberFormatter.string(for: self) ?? ""
    }
}
