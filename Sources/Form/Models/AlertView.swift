//
//  AlerView.swift
//  KingsAndQueens
//
//  Created by Mathias Erligmann on 25/11/2021.
//

import UIKit

class AlertView: UIView {
    
    private var alert: Alert
    
    private let activity = UIActivityIndicatorView()
    private let iconImageView = UIImageView()
    private let rightButton = UIButton()
    private let titleLabel = UILabel()
    private let superView: UIView
    let tableView: UITableView
    
    var isShown: Bool = false
    
    private var topConstraint: NSLayoutConstraint?
    private var heightConstraint: NSLayoutConstraint?
    
    init(alert: Alert, superView: UIView, tableView: UITableView) {
        self.alert = alert
        self.tableView = tableView
        self.superView = superView
        super.init(frame: .zero)
        configureAlertView(superView: superView,
                           tableView: tableView)
        configureRightButton()
        configureLeftItem()
        configureTitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeAlert(newAlert: Alert) {
        self.alert = newAlert
        configureRightButton()
        configureLeftItem()
        configureTitle()
        if !isShown {
            animate(show: true, in: 0)
        }
        if !alert.sticky {
            animate(show: false, in: 2)
        }
    }
    
    private func configureAlertView(superView: UIView,
                                    tableView: UITableView) {
        backgroundColor = .backColor
        layer.cornerRadius = 0
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 0
        translatesAutoresizingMaskIntoConstraints = false
        superView.addSubview(self)
        topConstraint = topAnchor.constraint(equalTo: tableView.topAnchor, constant: 0)
        topConstraint?.isActive = true
        heightConstraint =  heightAnchor.constraint(equalToConstant: 0)
        heightConstraint?.isActive = true
        leftAnchor.constraint(equalTo: superView.leftAnchor, constant: 0).isActive = true
        rightAnchor.constraint(equalTo: superView.rightAnchor, constant: -0).isActive = true
    }
    
    private func configureRightButton() {
        if alert.sticky {
            self.alert.buttonAction = { self.animate(show: false) }
            rightButton.addTarget(self, action: #selector(onAlertRightAction), for: .touchUpInside)
            rightButton.setImage(UIImage(systemName: "xmark"), for: .normal)
            rightButton.tintColor = .mainColor
            rightButton.translatesAutoresizingMaskIntoConstraints = false
            addSubview(rightButton)
            rightButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
            rightButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
            rightButton.centerYAnchor.constraint(equalTo: bottomAnchor, constant: -25).isActive = true
            rightButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        } else {
            rightButton.removeFromSuperview()
        }
    }
    
    private func configureLeftItem() {
        if alert.loading {
            configureActivity()
            iconImageView.image = nil
        } else {
            activity.stopAnimating()
            configureIconImageView()
        }
    }
    
    private func configureActivity() {
        activity.color = .mainColor
        activity.translatesAutoresizingMaskIntoConstraints = false
        addSubview(activity)
        activity.heightAnchor.constraint(equalToConstant: 35).isActive = true
        activity.widthAnchor.constraint(equalToConstant: 35).isActive = true
        activity.centerYAnchor.constraint(equalTo: topAnchor, constant: 25).isActive = true
        activity.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        activity.startAnimating()
    }
    
    private func configureIconImageView() {
        switch alert.image {
        case .system(let name):
            iconImageView.image = UIImage(systemName: name)
        default:
            break
        }
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .mainColor
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(iconImageView)
        iconImageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        //                iconImageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: bottomAnchor, constant: -25).isActive = true
        iconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
    }
    
    private func configureTitle() {
        titleLabel.text = alert.title.uppercasingFirst
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        titleLabel.textColor = .mainColor
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: alert.loading ? activity.rightAnchor : iconImageView.rightAnchor, constant: 8).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: bottomAnchor, constant: -25).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
    }
    
    // MARK: User Action
    
    @objc private func onAlertRightAction() {
        alert.buttonAction?()
    }
    
    func animate(show: Bool, in delay: Double = 0) {
        if show {
            self.isHidden = false
            UIView.animate(withDuration: 0.25, delay: delay) {
                self.heightConstraint?.constant = 50
                self.superView.layoutIfNeeded()
            } completion: { completed in
                if completed {
                    self.isShown = true
                    if !(self.alert.sticky) {
                        self.animate(show: false, in: 2)
                    }
                }
            }
        } else {
            UIView.animate(withDuration: 0.25, delay: delay) {
                self.heightConstraint?.constant = 0
                self.superView.layoutIfNeeded()
            } completion: { completed in
                if completed {
                    self.isHidden = true
                    self.isShown = false
                }
            }
        }
    }
}
