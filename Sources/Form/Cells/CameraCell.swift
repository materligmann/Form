//
//  CameraCell.swift
//  KingsAndQueens
//
//  Created by Mathias Erligmann on 23/11/2021.
//

import UIKit
import AVFoundation

public class CameraCell: UITableViewCell {
    
    private let captureView = UIView()
    private let captureImageView = UIImageView()
    private var captureSession: AVCaptureSession!
    private var previewLayer = AVCaptureVideoPreviewLayer()
    
    private var onCode: ((String) -> Void)?
    
    class var cellIdentifier: String {
        return "CameraCell"
    }
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureBackground()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        if captureSession.isRunning == true {
            captureSession.stopRunning()
        }
    }
    
    // MARK: Set
    
    func set(entry: FormModels.CameraEntry) {
        configureCaptureView()
        configureCaptureImageView()
        configureScan(scan: entry.scan)
        onCode = entry.onCode
        if captureSession.isRunning == false {
            captureSession.startRunning()
        }
    }
    
    // MARK: Configure
    
    private func configureBackground() {
        backgroundColor = .backColor
    }
    
    private func configureCaptureView() {
        captureView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(captureView)
        captureView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        captureView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        captureView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        captureView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    private func configureCaptureImageView() {
        captureImageView.contentMode = .scaleAspectFit
        captureImageView.image = UIImage(systemName: "square.dashed",
                                         withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .ultraLight))
        captureImageView.tintColor = .backColor
        captureImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(captureImageView)
        captureImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        captureImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        captureImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        captureImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    private func configureScan(scan: AVMetadataObject.ObjectType) {
        captureSession = AVCaptureSession()
        prepareDevice(scan: scan)
    }
    
    private func prepareDevice(scan: AVMetadataObject.ObjectType) {
        if let device = AVCaptureDevice.default(for: .video) {
            prepareVideo(for: device, scan: scan)
        } else {
            handleDeviceVideoError()
        }
    }
    
    private func prepareVideo(for device: AVCaptureDevice, scan: AVMetadataObject.ObjectType) {
        if let input = try? AVCaptureDeviceInput(device: device) {
            captureSession.addInput(input)
        } else {
            handleCantAddInputError()
            return
        }
        
        let output = AVCaptureMetadataOutput()
        if captureSession.canAddOutput(output) {
            captureSession.addOutput(output)
            output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            output.metadataObjectTypes = [scan]
            prepareCaptureView()
        } else {
            handleCantsAddOutputError()
            return
        }
    }
    
    private func prepareCaptureView() {
        contentView.layoutIfNeeded()
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = captureView.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        captureView.layer.addSublayer(previewLayer)
        captureSession.startRunning()
    }
    
    // MARK: Errors
    
    private func handleCantsAddOutputError() {
        print("cant add output error")
    }
    
    private func handleDeviceVideoError() {
        print("device video error")
    }
    
    private func handleCantAddInputError() {
        print("cant add input error")
    }
    
    // MARK: User Action
    
    private func onCodeFound(code: String) {
        onCode?(code)
    }
    
    // MARK: Display
}


extension CameraCell: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        captureSession.stopRunning()
        
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            onCodeFound(code: stringValue)
        }
//        previous()
    }
}
