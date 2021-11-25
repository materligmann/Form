//
//  Date+Strin.swift
//  GoGo
//
//  Created by Mathias Erligmann on 24/11/2020.
//

import Foundation

extension Date {
    func toHour() -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }
    
    func toDay() -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: self)
    }
}
