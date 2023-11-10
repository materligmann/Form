//
//  WebPresenter.swift
//  Waiter
//
//  Created by Mathias Erligmann on 12/06/2023.
//

import Foundation

class WebPresenter {
    weak var viewController: WebViewController?
    
    func presentWeb(urlString: String) {
        viewController?.displayWeb(urlString: urlString)
    }
}
