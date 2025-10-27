//
//  BioViewController 2.swift
//  mishkan-ios
//
//  Created by Mathias Erligmann on 01/12/2024.
//


import UIKit


@MainActor
public class WriteTextViewController: UIViewController,  UITextViewDelegate {
    
    public var request: WriteTextModels.Request?
    
    private let placeholderLabel = UILabel()
    private let doneButton = UIBarButtonItem()
    
    private let interactor = WriteTextInteractor()
    
    private let textTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.isScrollEnabled = true
        textView.textContainerInset = UIEdgeInsets(top: 15, left: 8, bottom: 15, right: 8)
        textView.layer.borderColor = UIColor.white.cgColor
        textView.layer.borderWidth = 1.0
        textView.textContainer.lineBreakMode = .byWordWrapping
        textView.clipsToBounds = true
        textView.layer.cornerRadius = 8.0
        textView.backgroundColor = .systemBackground
        textView.tintColor = .black
        return textView
    }()
    
    private let characterCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.textAlignment = .right
        return label
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configureBackground()
        configureDoneButton()
        configureBackItem()
        configureBioLabel()
        setupViews()
        
        interactor.load()
    }
    
    private var didAutoFocus = false

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard !didAutoFocus else { return }
        didAutoFocus = true
        // Let layout/transition fully settle before showing the keyboard
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) { [weak self] in
            self?.textTextView.becomeFirstResponder()
        }
    }
    
    
    
    // MARK: Setup
    
    private func setup() {
        interactor.request = request
        interactor.presenter.viewController = self
    }
    
    //MARK: Configure
    
    private func configureBackground() {
        view.backgroundColor = .systemBackground
    }
    
    private func configureBackItem() {
        let back = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .plain,
            target: self,
            action: #selector(onBack)
        )
        back.tintColor = .label
        navigationItem.leftBarButtonItem = back
    }
    
    private func configureDoneButton() {
        doneButton.title = "Done"
        doneButton.target = self
        doneButton.action = #selector(onDone)
        doneButton.tintColor = .label
        navigationItem.rightBarButtonItem = doneButton
    }
    
    private func configureBioLabel() {
        if let request {
            placeholderLabel.text = request.placeholder
        }
        placeholderLabel.textColor = .label
        placeholderLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(placeholderLabel)
        placeholderLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        placeholderLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 16).isActive = true
        placeholderLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        placeholderLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
    }
    
    private func setupViews() {
        textTextView.delegate = self
        if let request {
            characterCountLabel.text = "0/\(request.maxCharacters)"
        }
        // Add subviews
        view.addSubview(textTextView)
        view.addSubview(characterCountLabel)
        
        // Set constraints
        textTextView.translatesAutoresizingMaskIntoConstraints = false
        characterCountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textTextView.topAnchor.constraint(equalTo: placeholderLabel.bottomAnchor, constant: 10),
            textTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            // Dynamic height
            textTextView.heightAnchor.constraint(lessThanOrEqualToConstant: 250),
            textTextView.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
            
            characterCountLabel.topAnchor.constraint(equalTo: textTextView.bottomAnchor, constant: 8),
            characterCountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            characterCountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            characterCountLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    // MARK: Display
    
    func displayText(text: String) {
        textTextView.text = text
        textViewDidChange(textTextView)
    }
    
    // MARK: Action
    
    @objc private func onBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func onDone() {
        interactor.onDone()
    }
    
    
    public func textViewDidChange(_ textView: UITextView) {
        interactor.onText(text: textView.text)
        let characterCount = textView.text.count
        if let request {
            characterCountLabel.text = "\(characterCount)/\(request.maxCharacters)"
        }
    }
    
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if let request {
            let currentText = textView.text ?? ""
            let size = CGSize(width: textTextView.frame.width, height: .infinity)
            let estimatedSize = textTextView.sizeThatFits(size)
            guard let stringRange = Range(range, in: currentText) else { return false }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: text)
            if currentText.count > updatedText.count {
                return true
            } else if estimatedSize.height > 230 {
                return true
            } else {
                return updatedText.count <= request.maxCharacters
            }
        }
        return false
    }
    
    // MARK: Navigate
    
    func dismiss(completion: (() -> Void)?) {
        navigationController?.popViewController(animated: true, completion: completion)
    }
}
