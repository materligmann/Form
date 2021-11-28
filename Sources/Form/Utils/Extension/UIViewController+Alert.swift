//
//  UIViewController+Alert.swift
//  GoGo
//
//  Created by Mathias Erligmann on 28/11/2020.
//

import UIKit

protocol AlertViewable {
    var alertView: AlertView? { get set }
    func configureAlertView(alert: Alert, tableView: UITableView)
    func displayAlert(alert: Alert, tableView: UITableView?)
}

extension UIViewController: AlertViewable {
    
    struct Holder {
        static var alertView: AlertView?
    }
    
    public var alertView: AlertView? {
        get {
            return Holder.alertView
        }
        set(newValue) {
            Holder.alertView = newValue
        }
    }
    
    public func configureAlertView(alert: Alert, tableView: UITableView) {
        alertView = AlertView(alert: alert, superView: view, tableView: tableView)
    }
    
    public func displayAlert(alert: Alert, tableView: UITableView?) {
        if let tableView = tableView {
            if let currentAlertView = alertView, currentAlertView.tableView == tableView {
                currentAlertView.changeAlert(newAlert: alert)
            } else {
                configureAlertView(alert: alert, tableView: tableView)
                alertView?.animate(show: true, in: 0)
            }
        }
    }
    
    public func displayAlertSection(alert: Alert,
                      viewModel: ViewModel?,
                      tableView: UITableView?) {
        var alert = alert
        let stickyHideAction = {
            self.hideMessageSection(in: 2,
                             viewModel: viewModel,
                             tableView: tableView)
            
        }
        let hideAction = {
            self.hideMessageSection(in: 0,
                             viewModel: viewModel,
                             tableView: tableView)
            
        }
        let alertSection = alert.section(rightAction: hideAction)
        viewModel?.sections.insert(alertSection, at: 0)
        showMessageSection(tableView: tableView, onEnd: alert.sticky ? nil : stickyHideAction)
    }
    
    public func showMessageSection(tableView: UITableView?, onEnd: (() -> Void)?) {
        tableView?.beginUpdates()
        tableView?.insertSections(IndexSet(integer: 0), with: .fade)
        tableView?.endUpdates()
        onEnd?()
    }
    
    public func hideMessageSection(in delay: Double,
                     viewModel: ViewModel?,
                     tableView: UITableView?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            viewModel?.sections.remove(at: 0)
            tableView?.beginUpdates()
            tableView?.deleteSections(IndexSet(integer: 0), with: .fade)
            tableView?.endUpdates()
        }
    }
    
    public func displayMessage(message: Message) {
        let alert = UIAlertController(title: message.title,
                                      message: message.body,
                                      preferredStyle: .alert)
        if message.textField {
            alert.addTextField { textField in
                textField.autocorrectionType = .no
                textField.keyboardType = .alphabet
            }
        }
        if let actions = message.actions, !actions.isEmpty {
            for action in actions {
                let action = UIAlertAction(title: action.actionTitle,
                                           style: action.style.associatedAlertActionStyle) { _ in
                    if message.textField {
                        action.onCompletion?(alert.textFields?[0].text)
                    } else {
                        action.onCompletion?(nil)
                    }
                }
                alert.addAction(action)
            }
        }
        present(alert, animated: true)
    }
}
