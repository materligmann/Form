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
    
    public init(onChange: ((MKCoordinateRegion) -> Void)?,
                mode: MapEntryMode,
                region: MKCoordinateRegion?) {
        self.onChange = onChange
        self.mode = mode
        self.region = region
    }
}

public enum MapEntryMode {
    case set(Bool)
    case directions
    case show
}
