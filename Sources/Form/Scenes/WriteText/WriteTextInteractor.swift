//
//  BioInteractor.swift
//  mishkan-ios
//
//  Created by Mathias Erligmann on 27/11/2024.
//

@MainActor 
class WriteTextInteractor {
    
    var request: WriteTextModels.Request?
    
    let presenter = WriteTextPresenter()
    private let worker = WriteTextWorker()
    
    private var text: String?
    
    func load() {
        if let text = request?.text {
            self.text = text
            presenter.presentText(text: text)
        }
    }
    
    func onText(text: String?) {
        self.text = text
    }
    
    func onDone() {
        request?.onDone(text)
        presenter.dismiss(completion: nil)
    }
}
