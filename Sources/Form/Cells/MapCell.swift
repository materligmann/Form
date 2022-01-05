//
//  MapCell.swift
//  KingsAndQueens
//
//  Created by Mathias Erligmann on 12/11/2021.
//

import UIKit
import MapKit

public class MapCell: UITableViewCell {
    
    private let map = MKMapView()
    private let centerButton = UIButton()
    private let precisionLabel = UILabel()
    private let placeholderLabel = UILabel()
    private let targetImageView = UIImageView()
    private let slider = UISlider()
    private let minSpan = 0.1
    private let maxSpan = 1
    
    private var originRegion: MKCoordinateRegion?
    
    private var placeholder: String?
    
    private var onChange: ((MKCoordinateRegion) -> Void)?
    
    public class var cellIdentifier: String {
        return "MapCell"
    }
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureBackground()
        configureMap()
        configureCenterButton()
        configurePrecisionLabel()
        configurePlaceholderLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set
    
    func set(entry: MapEntry) {
        self.onChange = entry.onChange
        switch entry.mode {
        case .set(let zoom):
            configureTargetImageView()
            map.isUserInteractionEnabled = true
            targetImageView.tintColor = .backColor
            if zoom {
                configureSlider()
                map.bottomAnchor.constraint(equalTo: slider.topAnchor, constant: 0).isActive = true
            } else {
                map.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
            }
        case .get:
            let userLocation = map.userLocation
            let dest = entry.region.center
            let distance = userLocation.location?.distance(from: CLLocation(latitude: dest.latitude, longitude: dest.longitude))
            if let distance = distance {
                self.originRegion = MKCoordinateRegion(center: userLocation.coordinate,
                                                       latitudinalMeters: distance + distance * 0.2,
                                                       longitudinalMeters: distance + distance * 0.2)
                map.isUserInteractionEnabled = false
                map.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
                let annotation = MKPointAnnotation()
                annotation.coordinate = entry.region.center
                map.addAnnotation(annotation)
                
                let request = MKDirections.Request()
                // Source
                let sourcePlaceMark = MKPlacemark.init(coordinate: map.userLocation.coordinate)
                request.source = MKMapItem(placemark: sourcePlaceMark)
                // Destination
                let destPlaceMark = MKPlacemark(coordinate: annotation.coordinate)
                request.destination = MKMapItem(placemark: destPlaceMark)
                // Transport Types
                request.transportType = [.automobile, .walking]
                
                let directions = MKDirections(request: request)
                directions.calculate { response, error in
                    guard let response = response else {
                        print("Error: \(error?.localizedDescription ?? "No error specified").")
                        return
                    }
                    
                    let route = response.routes[0]
                    self.map.addOverlay(route.polyline)
                }
            }
        }
        self.originRegion = entry.region
        if let originRegion = originRegion {
            map.setRegion(originRegion, animated: false)
        }
        self.onChange?(map.region)
    }
    
    // MARK: Configure
    
    private func configureBackground() {
        backgroundColor = .backColor
    }
    
    private func configureSlider() {
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.value = 0
        slider.addTarget(self, action: #selector(onSliderChange), for: .valueChanged)
        slider.tintColor = .mainColor
        slider.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(slider)
        slider.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        slider.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        slider.heightAnchor.constraint(equalToConstant: 50).isActive = true
        slider.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    private func configureMap() {
        map.delegate = self
        map.isRotateEnabled = false
        map.showsUserLocation = true
        map.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(map)
        map.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        map.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        map.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
    }
    
    private func configureCenterButton() {
        centerButton.addTarget(self, action: #selector(centerOnOrigin), for: .touchUpInside)
        centerButton.layer.cornerRadius = 5
        centerButton.layer.borderWidth = 1
        centerButton.tintColor = .mainColor
        centerButton.backgroundColor = .backColor
        centerButton.setImage(UIImage(systemName: "location"), for: .normal)
        centerButton.translatesAutoresizingMaskIntoConstraints = false
        map.addSubview(centerButton)
        centerButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        centerButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        centerButton.rightAnchor.constraint(equalTo: map.rightAnchor, constant: -8).isActive = true
        centerButton.bottomAnchor.constraint(equalTo: map.bottomAnchor, constant: -8).isActive = true
    }
    
    private func configurePrecisionLabel() {
        precisionLabel.text = "Precision: "
        precisionLabel.adjustsFontSizeToFitWidth = true
        precisionLabel.textAlignment = .center
        precisionLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        precisionLabel.textColor = .mainColor
        precisionLabel.layer.cornerRadius = 5
        precisionLabel.layer.borderWidth = 1
        precisionLabel.backgroundColor = .backColor
        precisionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(precisionLabel)
        precisionLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        precisionLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        precisionLabel.leftAnchor.constraint(equalTo: map.leftAnchor, constant: 8).isActive = true
        precisionLabel.bottomAnchor.constraint(equalTo: map.bottomAnchor, constant: -8).isActive = true
    }
    
    private func configureTargetImageView() {
        targetImageView.contentMode = .scaleAspectFit
        targetImageView.image = UIImage(systemName: "smallcircle.filled.circle")
        targetImageView.translatesAutoresizingMaskIntoConstraints = false
        map.addSubview(targetImageView)
        targetImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        targetImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        targetImageView.centerYAnchor.constraint(equalTo: map.centerYAnchor, constant: 0).isActive = true
        targetImageView.centerXAnchor.constraint(equalTo: map.centerXAnchor, constant: 0).isActive = true
    }
    
    private func configurePlaceholderLabel() {
        placeholderLabel.textColor = .lightGray
        placeholderLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(placeholderLabel)
        placeholderLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        placeholderLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
    }
    
    // MARK: Display
    
    @objc private func centerOnOrigin() {
        if let originRegion = originRegion {
            map.setRegion(originRegion, animated: true)
        }
    }
    
    @objc private func onSliderChange() {
        map.setRegion(MKCoordinateRegion(center: map.centerCoordinate,
                                         span: MKCoordinateSpan(latitudeDelta: Double(slider.value),
                                                                longitudeDelta: Double(slider.value))),
                      animated: false)
    }
}

extension MapCell: MKMapViewDelegate {
    public func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        let targetRegion = map.convert(CGRect(origin: CGPoint(x: map.frame.midX, y: map.frame.midY), size: CGSize(width: 30, height: 30)), toRegionFrom: map)
        let oneDegreeInKm: Double = 111139
        let precision = Int(targetRegion.span.latitudeDelta * oneDegreeInKm)
        precisionLabel.text = "\(precision) m"
        onChange?(mapView.region)
    }
    
    public func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            // Set the color for the line
            renderer.strokeColor = .systemBlue
            return renderer
        }
}
