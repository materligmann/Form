//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 27/08/2022.
//

import Foundation
import UIKit
import MapKit


public class BasicMapCell: UITableViewCell {
    
    private let valueLabel = UILabel()
    private let map = MKMapView()
    
    public class var cellIdentifier: String {
        return "BasicMapCell"
    }
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        configureMap()
        configureValueLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set
    
    private func configureMap() {
        map.layer.cornerRadius = 5
        map.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(map)
        map.heightAnchor.constraint(equalToConstant: 80).isActive = true
        map.widthAnchor.constraint(equalToConstant: 80).isActive = true
        map.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        map.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
    }
    
    private func configureValueLabel() {
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(valueLabel)
        valueLabel.leftAnchor.constraint(equalTo: map.rightAnchor, constant: 5).isActive = true
        valueLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        valueLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        valueLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
    }
    
    func set(entry: BasicMapEntry) {
        map.setRegion(MKCoordinateRegion(center: entry.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01,
                                                                                          longitudeDelta: 0.01)),
                      animated: false)
        valueLabel.text = entry.title ?? "Configure your ad"
    }
}
