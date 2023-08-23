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
    
    public init(segments: [Segment], onSegmentChange: @escaping (String) -> Void, isEnabled: Bool) {
        self.segments = segments
        self.onSegmentChange = onSegmentChange
        self.isEnabled = isEnabled
    }
}

public struct Segment {
    let name: String
    let isSelected: Bool
    
    public init(name: String, isSelected: Bool) {
        self.name = name
        self.isSelected = isSelected
    }
}
