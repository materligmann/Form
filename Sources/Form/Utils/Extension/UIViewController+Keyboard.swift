//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 29/08/2022.
//

import UIKit


private var keyboardConstraintKey: UInt8 = 0

extension UIViewController {
    
    var keyboardAwareConstraint: NSLayoutConstraint? {
            get {
                return objc_getAssociatedObject(self, &keyboardConstraintKey) as? NSLayoutConstraint
            }
            set {
                objc_setAssociatedObject(self, &keyboardConstraintKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    
    public func observeKeyboard(with constraint: NSLayoutConstraint) {
        self.keyboardAwareConstraint = constraint
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc open func keyboardWillShow(sender: NSNotification) {
           guard let keyboardFrame = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
           let keyboardHeight = keyboardFrame.cgRectValue.height
           keyboardAwareConstraint?.constant = -keyboardHeight
           UIView.animate(withDuration: 0.25) {
               self.view.layoutIfNeeded()
           }
       }
       
       @objc open func keyboardWillHide(sender: NSNotification) {
           keyboardAwareConstraint?.constant = -50
           UIView.animate(withDuration: 0.25) {
               self.view.layoutIfNeeded()
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
