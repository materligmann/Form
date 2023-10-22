//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 23/10/2023.
//

import UIKit

extension UIImage {
    public func resize(targetSize: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size:targetSize).image { _ in
            self.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
}
