//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 25/12/2021.
//

import Foundation
import AVFoundation

public struct CameraEntry {
    let onCode: ((String) -> Void)
    let scan: AVMetadataObject.ObjectType
    
    public init(onCode: @escaping ((String) -> Void), scan: AVMetadataObject.ObjectType) {
        self.onCode = onCode
        self.scan = scan
    }
}
