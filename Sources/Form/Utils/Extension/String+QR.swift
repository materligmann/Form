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
        
        let scaledQR = outputImage.transformed(by: CGAffineTransform(scaleX: 10, y: 10))
        let context = CIContext()

        if lightBackground {
            guard let cgImage = context.createCGImage(scaledQR, from: scaledQR.extent) else { return nil }
            return UIImage(cgImage: cgImage)
        } else {
            guard let colorInvert = CIFilter(name: "CIColorInvert"),
                  let maskToAlpha = CIFilter(name: "CIMaskToAlpha") else { return nil }
            colorInvert.setValue(scaledQR, forKey: kCIInputImageKey)
            guard let inverted = colorInvert.outputImage else { return nil }
            maskToAlpha.setValue(inverted, forKey: kCIInputImageKey)
            guard let finalCI = maskToAlpha.outputImage,
                  let cgImage = context.createCGImage(finalCI, from: finalCI.extent) else { return nil }
            return UIImage(cgImage: cgImage)
        }
    }
}
