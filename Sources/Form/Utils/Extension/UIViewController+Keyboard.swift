//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 29/08/2022.
//

import UIKit

extension UIViewController {
    open func configureKeyboardNotification(bottom: NSLayoutConstraint) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name:UIResponder.keyboardWillShowNotification, object: bottom);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name:UIResponder.keyboardWillHideNotification, object: bottom);
    }
    
    @objc open func keyboardWillShow(sender: NSNotification) {
        if let bottom = sender.object as? NSLayoutConstraint,
           let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            bottom.constant = -keyboardHeight
            UIView.animate(withDuration: 0.25) {
                self.view.layoutSubviews()
            }
        }
    }
    
    @objc open func keyboardWillHide(sender: NSNotification) {
        if let bottom = sender.object as? NSLayoutConstraint {
            bottom.constant = 0
            UIView.animate(withDuration: 0.25) {
                self.view.layoutSubviews()
            }
        }
    }
    
    
    public func configureKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:    #selector(UIViewController.dismissKeyboardTouchOutside))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc public func dismissKeyboardTouchOutside() {
        view.endEditing(true)
    }
}
