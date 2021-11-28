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
    let region: MKCoordinateRegion?
}

enum MapEntryMode {
    case set(UIColor, Bool)
    case get
}
