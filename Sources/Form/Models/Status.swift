//
//  Status.swift
//  KingsAndQueens
//
//  Created by Mathias Erligmann on 22/11/2021.
//

import UIKit

public enum Status: String {
    case success
    case pending
    case failed
    
    func symbol() -> String {
        switch self {
        case .success:
            return "checkmark.circle.fill"
        case .pending:
            return "timelapse"
        case .failed:
            return "xmark.octagon.fill"
        }
    }
    
    func color() -> UIColor {
        switch self {
        case .success:
            return .systemGreen
        case .pending:
            return .systemOrange
        case .failed:
            return .systemRed
        }
    }
}
