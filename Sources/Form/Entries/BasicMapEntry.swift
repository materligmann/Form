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
    let action: (() -> Void)
    
    public init(coordinate: CLLocationCoordinate2D, title: String?, action: @escaping () -> Void) {
        self.coordinate = coordinate
        self.title = title
        self.action = action
    }
}
