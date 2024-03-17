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
        var mode: Mode
        
        public init(scanType: [AVMetadataObject.ObjectType], onCodeFound: ((String) -> Void)? = nil, mode: Mode) {
            self.scanType = scanType
            self.onCodeFound = onCodeFound
            self.mode = mode
        }
    }
    
    public enum Mode {
        case present
        case navigation
    }
}


