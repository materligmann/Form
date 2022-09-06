//
//  Numbers+DeviceSizing.swift
//  Chaud devant ! Pro
//
//  Created by Mathias Erligmann on 22/11/2019.
//  Copyright © 2019 Mathias Erligmann. All rights reserved.
//

import UIKit

let figmaIphoneHeight: CGFloat = 812.0
let figmaIphoneWidth: CGFloat = 375.0

extension Int {
    
    func forDeviceHeight() -> CGFloat {
        let deviceHeight = UIScreen.main.bounds.height
        let ratio = deviceHeight / figmaIphoneHeight
        return CGFloat(self) * ratio
    }
    
    func forDeviceWidth() -> CGFloat {
        let deviceWidth = UIScreen.main.bounds.width
        let ratio = deviceWidth / figmaIphoneWidth
        return CGFloat(self) * ratio
    }
    
    func forDeviceScale() -> CGFloat {
        let deviceWidth = UIScreen.main.bounds.width
        let ratioW = deviceWidth / figmaIphoneWidth
        
        let deviceHeight = UIScreen.main.bounds.height
        let ratioH = deviceHeight / figmaIphoneHeight
        
        let ratioS = (ratioH + ratioW) / 2
        
        return CGFloat(self) * ratioS
    }
}

extension CGFloat {
    
    func forDeviceHeight() -> CGFloat {
        let deviceHeight = UIScreen.main.bounds.height
        let ratio = deviceHeight / figmaIphoneHeight
        return CGFloat(self) * ratio
    }
    
    func forDeviceWidth() -> CGFloat {
        let deviceWidth = UIScreen.main.bounds.width
        let ratio = deviceWidth / figmaIphoneWidth
        return CGFloat(self) * ratio
    }
    
    func forDeviceScale() -> CGFloat {
        let deviceWidth = UIScreen.main.bounds.width
        let ratioW = deviceWidth / figmaIphoneWidth
        
        let deviceHeight = UIScreen.main.bounds.height
        let ratioH = deviceHeight / figmaIphoneHeight
        
        let ratioS = (ratioH + ratioW) / 2
        
        return CGFloat(self) * ratioS
    }
}

extension Double {
    
    func forDeviceHeight() -> CGFloat {
        let deviceHeight = UIScreen.main.bounds.height
        let ratio = deviceHeight / figmaIphoneHeight
        return CGFloat(self) * ratio
    }
    
    func forDeviceWidth() -> CGFloat {
        let deviceWidth = UIScreen.main.bounds.width
        let ratio = deviceWidth / figmaIphoneWidth
        return CGFloat(self) * ratio
    }
    
    func forDeviceScale() -> CGFloat {
        let deviceWidth = UIScreen.main.bounds.width
        let ratioW = deviceWidth / figmaIphoneWidth
        
        let deviceHeight = UIScreen.main.bounds.height
        let ratioH = deviceHeight / figmaIphoneHeight
        
        let ratioS = (ratioH + ratioW) / 2
        
        return CGFloat(self) * ratioS
    }
}

