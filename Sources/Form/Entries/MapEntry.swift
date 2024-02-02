//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 28/11/2021.
//

import Foundation
import MapKit

// MARK: Map

public struct MapEntry {
    public let onChange: ((MKCoordinateRegion) -> Void)?
    public let mode: MapEntryMode
    public let region: MKCoordinateRegion?
    public let border: Bool
    public let color: UIColor
    
    public init(onChange: ((MKCoordinateRegion) -> Void)?,
                mode: MapEntryMode,
                region: MKCoordinateRegion?,
                border: Bool, color: UIColor) {
        self.onChange = onChange
        self.mode = mode
        self.region = region
        self.border = border
        self.color = color
    }
}

public enum MapEntryMode {
    case set(Bool)
    case directions
    case show
}
