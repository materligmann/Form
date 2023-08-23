//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 24/08/2023.
//

import Foundation

public struct SegmentEntry {
    let segments: [Segment]
    let onSegmentChange: (String) -> Void
    let isEnabled: Bool
}

public struct Segment {
    let name: String
    let isSelected: Bool
}
