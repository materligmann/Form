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
    let onChange: ((MKCoordinateRegion) -> Void)?
    let mode: MapEntryMode
    let region: MKCoordinateRegion
    
    public init(onChange: ((MKCoordinateRegion) -> Void)?,
                mode: MapEntryMode,
                region: MKCoordinateRegion) {
        self.onChange = onChange
        self.mode = mode
        self.region = region
    }
}

public enum MapEntryMode {
    case set(Bool)
    case get
}
