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
    let onLocation: ((CLLocation) -> Void)?
    
    public init(onChange: ((MKCoordinateRegion) -> Void)?,
                mode: MapEntryMode,
                region: MKCoordinateRegion,
                onLocation: ((CLLocation) -> Void)?) {
        self.onChange = onChange
        self.mode = mode
        self.region = region
        self.onLocation = onLocation
    }
}

public enum MapEntryMode {
    case set(UIColor, Bool)
    case get
}
