//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 27/08/2022.
//

import Foundation
import CoreLocation

public struct BasicMapEntry {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    
    public init(coordinate: CLLocationCoordinate2D, title: String?) {
        self.coordinate = coordinate
        self.title = title
    }
}
