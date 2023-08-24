//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 24/08/2023.
//

import Foundation
import AVFoundation

public enum ScanModels {
    public struct Request {
        var scanType: [AVMetadataObject.ObjectType]
        var onCodeFound: ((String) -> Void)?
        
        public init(scanType: [AVMetadataObject.ObjectType], onCodeFound: ((String) -> Void)? = nil) {
            self.scanType = scanType
            self.onCodeFound = onCodeFound
        }
    }
}
