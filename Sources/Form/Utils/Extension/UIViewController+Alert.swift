//
//  UIViewController+Alert.swift
//  GoGo
//
//  Created by Mathias Erligmann on 28/11/2020.
//

import UIKit

extension UIViewController {
    
    func displayAlert(alert: Alert, tableView: UITableView?) {
        if let tableView = tableView {
            let alertView = AlerView(alert: alert, superView: view, tableView: tableView)
            alertView.animate(show: true)
        }
    }
    
    func hideMessage(in second: Double, constraint: NSLayoutConstraint?) {
        UIView.animate(withDuration: 0.25, delay: second) {
            constraint?.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    func displayAlertSection(alert: Alert,
                      viewModel: FormModels.ViewModel?,
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
    
    func showMessageSection(tableView: UITableView?, onEnd: (() -> Void)?) {
        tableView?.beginUpdates()
        tableView?.insertSections(IndexSet(integer: 0), with: .fade)
        tableView?.endUpdates()
        onEnd?()
    }
    
    func hideMessageSection(in delay: Double,
                     viewModel: FormModels.ViewModel?,
                     tableView: UITableView?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            viewModel?.sections.remove(at: 0)
            tableView?.beginUpdates()
            tableView?.deleteSections(IndexSet(integer: 0), with: .fade)
            tableView?.endUpdates()
        }
    }
    
    func displayMessage(message: Message) {
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
