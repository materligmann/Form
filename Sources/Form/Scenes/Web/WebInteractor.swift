//
//  WebInteractor.swift
//  Waiter
//
//  Created by Mathias Erligmann on 12/06/2023.
//

import Foundation

class WebInteractor {
    let presenter = WebPresenter()
    var request: WebModels.Request?
    
    func loadWeb() {
        if let request {
            presenter.presentWeb(urlString: request.url)
        }
    }
}
