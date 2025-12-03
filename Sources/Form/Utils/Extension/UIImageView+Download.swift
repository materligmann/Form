//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 06/10/2023.
//

import UIKit
import ObjectiveC

private var AssociatedURLHandle: UInt8 = 0

extension UIImageView {
    public var currentURL: URL? {
        get { return objc_getAssociatedObject(self, &AssociatedURLHandle) as? URL }
        set { objc_setAssociatedObject(self, &AssociatedURLHandle, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
}

extension UIImageView {
    public func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        currentURL = url  // Track which URL this UIImageView wants

        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }

            // Validate download
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }

            DispatchQueue.main.async {
                // 🛑 If the imageView has been reused and URL changed → do nothing
                guard self.currentURL == url else { return }

                self.image = image
            }
        }.resume()
    }

    public func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}


extension URL {
    public func image(completion: @escaping (UIImage) -> Void ) {
        URLSession.shared.dataTask(with: self) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType,
                mimeType.hasPrefix("image"),
                let data = data,
                error == nil,
                let image = UIImage(data: data)
            else { return }
            completion(image)
        }.resume()
    }
}
