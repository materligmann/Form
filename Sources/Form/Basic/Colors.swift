//
//  Colors.swift
//  GoGo
//
//  Created by Mathias Erligmann on 22/11/2020.
//

import UIKit

public extension UIColor {
    @nonobjc class var mainColor: UIColor {
        return .black
    }
    
    @nonobjc class var backColor: UIColor {
        return .white
    }
    
    @nonobjc class var backLightColor: UIColor {
        return #colorLiteral(red: 0.2049798965, green: 0.1749709547, blue: 0.2059892118, alpha: 1)
    }
    
    @nonobjc class var receiveColor: UIColor {
        return #colorLiteral(red: 1, green: 0.8072921634, blue: 0, alpha: 1)
    }
    
    @nonobjc class var sendColor: UIColor {
        return #colorLiteral(red: 0.4157947302, green: 0.3360839188, blue: 1, alpha: 1)
    }
}

