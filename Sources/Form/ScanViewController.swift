//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 24/08/2023.
//

import UIKit
import AVFoundation

public class ScanViewController: UIViewController {
    
    private let captureView = UIView()
    private let dismissButton = UIBarButtonItem()
    private var captureSession: AVCaptureSession!
    private var previewLayer = AVCaptureVideoPreviewLayer()
    private let frameOverlay = UIImageView()
    
    private let request: ScanModels.Request
    
    // MARK: Lifecycle
    
    public init(request: ScanModels.Request) {
        self.request = request
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureDismissButton()
        configureTitle()
        configureNavigation()
        configureBackground()
        configureCaptureView()
        configureScan()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if captureSession.isRunning == false {
            DispatchQueue.global(qos: .userInitiated).async {
                self.captureSession.startRunning()
            }
        }
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if captureSession.isRunning == true {
            captureSession.stopRunning()
        }
    }
    
    // MARK: Configure
    
    private func configureDismissButton() {
        switch request.mode {
        case .present:
            dismissButton.image = UIImage(systemName: "xmark")
            dismissButton.target = self
            dismissButton.action = #selector(dismissButtonWasPressed)
            navigationItem.leftBarButtonItem = dismissButton
        case .navigation:
            break
        }
    }
    
    private func configureTitle() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font:
                                                                    UIFont.systemFont(ofSize: 20, weight: .bold)]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.mainColor]
        title = "Scan"
    }
    
    private func configureBackground() {
        view.backgroundColor = .black
    }
    
    private func configureNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func configureCaptureView() {
        captureView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(captureView)
        captureView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        captureView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        captureView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
        captureView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    private func configureFrameOverlay() {
        frameOverlay.image = UIImage(named: "frame")?.withRenderingMode(.alwaysTemplate).withTintColor(.white)
        frameOverlay.contentMode = .scaleAspectFit
        frameOverlay.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(frameOverlay)

        NSLayoutConstraint.activate([
            frameOverlay.centerXAnchor.constraint(equalTo: captureView.centerXAnchor),
            frameOverlay.centerYAnchor.constraint(equalTo: captureView.centerYAnchor),
            frameOverlay.widthAnchor.constraint(equalToConstant: 250),
            frameOverlay.heightAnchor.constraint(equalToConstant: 250)
        ])
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

        DispatchQueue.global(qos: .userInitiated).async {
            self.captureSession.startRunning()
        }
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
        switch request.mode {
        case .present:
            navigationController?.dismiss(animated: true, completion: { self.request.onCodeFound?(code) })
        case .navigation:
            navigationController?.popViewController(animated: true, completion: {self.request.onCodeFound?(code)})
        }
    }
    
    @objc private func dismissButtonWasPressed() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}

extension ScanViewController: AVCaptureMetadataOutputObjectsDelegate {
    public func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        self.captureSession.stopRunning()
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            onCodeFound(code: stringValue)
        }
//        previous()
    }
}

