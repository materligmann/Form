
import UIKit

extension String {
    public func generateQRCodeFromString(lightBackground: Bool = true) -> UIImage? {
        guard let data = self.data(using: .utf8),
              let qrFilter = CIFilter(name: "CIQRCodeGenerator"),
              let colorFilter = CIFilter(name: "CIFalseColor") else {
            return nil
        }

        qrFilter.setValue(data, forKey: "inputMessage")
        qrFilter.setValue("M", forKey: "inputCorrectionLevel")

        guard let qrImage = qrFilter.outputImage else { return nil }

        // Scale it
        let transformedImage = qrImage.transformed(by: CGAffineTransform(scaleX: 10, y: 10))

        // Set colors depending on background style
        colorFilter.setValue(transformedImage, forKey: "inputImage")
        if lightBackground {
            colorFilter.setValue(CIColor(color: .black), forKey: "inputColor0") // QR pixels
            colorFilter.setValue(CIColor(color: .white), forKey: "inputColor1") // Background
        } else {
            colorFilter.setValue(CIColor(color: .white), forKey: "inputColor0") // QR pixels
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
