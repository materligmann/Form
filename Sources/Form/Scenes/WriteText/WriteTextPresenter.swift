//
//  BioPresenter.swift
//  mishkan-ios
//
//  Created by Mathias Erligmann on 27/11/2024.
//

@MainActor
class WriteTextPresenter {
    weak var viewController: WriteTextViewController?
    
    func dismiss(completion: (() -> Void)?) {
        viewController?.dismiss(completion: completion)
    }
    
    func presentText(text: String) {
        viewController?.displayText(text: text)
    }
}
