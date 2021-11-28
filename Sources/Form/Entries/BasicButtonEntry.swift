//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 28/11/2021.
//

import UIKit

// MARK: BasicButtonEntry

public struct BasicButtonEntry {
    let loading: Bool
    let title: String?
    let color: UIColor
    let tintColor: UIColor
    let onPress: (() -> Void)?
    let font: UIFont?
    let imageName: String?
}
