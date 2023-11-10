//
//  WebViewController.swift
//  Waiter
//
//  Created by Mathias Erligmann on 12/06/2023.
//

import UIKit
import WebKit

public class WebViewController: UIViewController {
    
    private let webView = WKWebView()
    
    public var request: WebModels.Request?
    
    private let interactor = WebInteractor()

    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configureBackground()
        configureWebView()
        
        interactor.loadWeb()
    }
    
    // MARK: Setup
    
    private func setup() {
        interactor.presenter.viewController = self
        interactor.request = request
    }
    
    // MARK: Configure
    
    private func configureBackground() {
        view.backgroundColor = .white
    }
    
    private func configureWebView() {
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(webView)
        webView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        webView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        webView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    // MARK: Display
    
    func displayWeb(urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}


extension WebViewController: WKNavigationDelegate {
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Swift.Void) {
        guard navigationAction.navigationType == .other || navigationAction.navigationType == .reload  else {
            decisionHandler(.cancel)
            return
        }
        decisionHandler(.allow)
    }
}
