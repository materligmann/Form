
import UIKit

extension String {
    public func generateQRCodeFromString(lightBackground: Bool = true) -> UIImage? {
        guard let data = self.data(using: .utf8),
              let qrFilter = CIFilter(name: "CIQRCodeGenerator") else {
            return nil
        }

        qrFilter.setValue(data, forKey: "inputMessage")
        qrFilter.setValue("M", forKey: "inputCorrectionLevel")
        guard let outputImage = qrFilter.outputImage else { return nil }

        // Scale it
        let scaledQR = outputImage.transformed(by: CGAffineTransform(scaleX: 10, y: 10))

        // Apply color filter
        guard let colorFilter = CIFilter(name: "CIFalseColor") else { return nil }

        colorFilter.setValue(scaledQR, forKey: kCIInputImageKey)
        if lightBackground {
            colorFilter.setValue(CIColor(color: .black), forKey: "inputColor0") // QR code dots
            colorFilter.setValue(CIColor(color: .white), forKey: "inputColor1") // Background
        } else {
            colorFilter.setValue(CIColor(color: .white), forKey: "inputColor0") // QR code dots
            colorFilter.setValue(CIColor(color: .black), forKey: "inputColor1") // Background
        }

        guard let coloredQR = colorFilter.outputImage else { return nil }

        let context = CIContext()
        guard let cgImage = context.createCGImage(coloredQR, from: coloredQR.extent) else {
            return nil
        }

        return UIImage(cgImage: cgImage)
    }
}
