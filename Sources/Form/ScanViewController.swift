//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 24/08/2023.
//

import UIKit
import AVFoundation

class ScanViewController: UIViewController {
    
    private let captureView = UIView()
    private let dismissButton = UIBarButtonItem()
    private var captureSession: AVCaptureSession!
    private var previewLayer = AVCaptureVideoPreviewLayer()
    
    private let request: ScanModels.Request
    
    // MARK: Lifecycle
    
    init(request: ScanModels.Request) {
        self.request = request
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTitle()
        configureNavigation()
        configureBackground()
        configureCaptureView()
        configureScan()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if captureSession.isRunning == false {
            captureSession.startRunning()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if captureSession.isRunning == true {
            captureSession.stopRunning()
        }
    }
    
    // MARK: Configure
    
    private func configureTitle() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font:
                                                                    UIFont.systemFont(ofSize: 20, weight: .bold)]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.mainColor]
        title = "Scan"
    }
    
    private func configureBackground() {
        view.backgroundColor = .white
    }
    
    private func configureNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.tintColor = .mainColor
    }
    
    private func configureCaptureView() {
        captureView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(captureView)
        captureView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        captureView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        captureView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
        captureView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    
    private func configureScan() {
        captureSession = AVCaptureSession()
        prepareDevice()
    }
    
    // MARK: Prepare
    
    private func prepareDevice() {
        if let device = AVCaptureDevice.default(for: .video) {
            prepareVideo(for: device)
        } else {
            handleDeviceVideoError()
        }
    }
    
    private func prepareVideo(for device: AVCaptureDevice) {
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
            output.metadataObjectTypes = [.qr]
            prepareCaptureView()
        } else {
            handleCantsAddOutputError()
            return
        }
    }
    
    private func prepareCaptureView() {
        view.layoutIfNeeded()
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
        navigationController?.popViewController(animated: true)
        request.onCodeFound?(code)
    }
    
    @objc private func dismissButtonWasPressed() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func previous() {
        navigationController?.popViewController(animated: true)
    }
}

extension ScanViewController: AVCaptureMetadataOutputObjectsDelegate {
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

