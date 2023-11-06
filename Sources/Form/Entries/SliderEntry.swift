//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 30/12/2021.
//

import UIKit

public struct SliderEntry {
    let onSliderChange: (Float, Bool, Bool) -> Void
    let initialValue: Float
    let minimum: Float
    let maximum: Float
    let tintColor: UIColor
    
    public init(onSliderChange: @escaping (Float, Bool, Bool) -> Void,
                initialValue: Float,
                minimum: Float,
                maximum: Float, tintColor: UIColor) {
        self.onSliderChange = onSliderChange
        self.initialValue = initialValue
        self.minimum = minimum
        self.maximum = maximum
        self.tintColor = tintColor
    }
}
