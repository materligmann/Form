//
//  File.swift
//  
//
//  Created by Mathias Erligmann on 28/12/2021.
//

import UIKit

public class CustomActivityViewController: UIActivityViewController {

    private let controller: UIViewController!
    
    private let onDismiss: (() -> Void)?

    required public init(controller: UIViewController, onDismiss: (() -> Void)? = nil) {
        self.controller = controller
        self.onDismiss = onDismiss
        super.init(activityItems: [], applicationActivities: nil)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        let subViews = self.view.subviews
        for view in subViews {
            view.removeFromSuperview()
        }

        self.addChild(controller)
        self.view.addSubview(controller.view)
    }
    
    deinit {
        onDismiss?()
    }
}
