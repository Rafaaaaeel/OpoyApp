//
//  ResetPassword.swift
//  OpoyApp
//
//  Created by Rafael Oliveira on 12/04/22.
//

import Foundation
import UIKit


// MARK: Reset
class ResetPasswordController: UIViewController{
    
    let stackView = UIStackView()
    let forgotPasswordTitle =  UILabel()
    let forgotPasswordSbTitle = UILabel()
    let resetView = ResetPasswordView(placeholder: "Email", isSecurityCode: false, onlyKeyboard: false)
    let sendButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension ResetPasswordController{
    private func style(){
        
        view.backgroundColor = .systemBackground
        resetView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.axis = .vertical
        
        forgotPasswordTitle.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordTitle.textAlignment = .center
        forgotPasswordTitle.font = UIFont.boldSystemFont(ofSize: 32)
        forgotPasswordTitle.text = "Forgot Password"
        
        forgotPasswordSbTitle.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordSbTitle.textAlignment = .center
        forgotPasswordSbTitle.font = UIFont.boldSystemFont(ofSize: 17)
        forgotPasswordSbTitle.textColor = .systemGray
        forgotPasswordSbTitle.numberOfLines = 0
        forgotPasswordSbTitle.text = "Enter your email for the verification process we will send 4 digits code to your email."
        
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.tintColor = appColor
        sendButton.configuration = .filled()
        sendButton.setTitle("CONTINUE", for: [])
        sendButton.configuration?.imagePadding = 8
        sendButton.addTarget(self, action: #selector(continueButtonPressed), for: .primaryActionTriggered)
        
        
    }
    
    private func layout(){
        stackView.addArrangedSubview(forgotPasswordTitle)
        stackView.addArrangedSubview(forgotPasswordSbTitle)
        stackView.addArrangedSubview(resetView)
        stackView.addArrangedSubview(sendButton)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 4)
        ])
    }
}

extension ResetPasswordController{
    @objc func continueButtonPressed(_ sender: UIButton){
        navigationController?.pushViewController(ValidationViewController(), animated: true)
    }
}

// MARK: Validation Code

class ValidationViewController: UIViewController{
    
    let stackView = UIStackView()
    let enterCodeTitle =  UILabel()
    let enterCodeSubtitle = UILabel()
    let resetView = ResetPasswordView(placeholder: "Code", isSecurityCode: false, onlyKeyboard: true)
    let sendButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension ValidationViewController{
    private func style(){
        navigationItem.hidesBackButton = true
        view.backgroundColor = .systemBackground
        resetView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.axis = .vertical
        
        enterCodeTitle.translatesAutoresizingMaskIntoConstraints = false
        enterCodeTitle.textAlignment = .center
        enterCodeTitle.font = UIFont.boldSystemFont(ofSize: 32)
        enterCodeTitle.text = "Enter the code"
        
        enterCodeSubtitle.translatesAutoresizingMaskIntoConstraints = false
        enterCodeSubtitle.textAlignment = .center
        enterCodeSubtitle.font = UIFont.boldSystemFont(ofSize: 17)
        enterCodeSubtitle.textColor = .systemGray
        enterCodeSubtitle.numberOfLines = 0
        enterCodeSubtitle.text = "Enter the 4 digits code that you received on your email"
        
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.tintColor = appColor
        sendButton.configuration = .filled()
        sendButton.setTitle("CONTINUE", for: [])
        sendButton.configuration?.imagePadding = 8
        sendButton.addTarget(self, action: #selector(continueButtonPressed), for: .primaryActionTriggered)
        
        
    }
    
    private func layout(){
        stackView.addArrangedSubview(enterCodeTitle)
        stackView.addArrangedSubview(enterCodeSubtitle)
        stackView.addArrangedSubview(resetView)
        stackView.addArrangedSubview(sendButton)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 4)
        ])
    }
}

extension ValidationViewController{
    @objc func continueButtonPressed(_ sender: UIButton){
        navigationController?.pushViewController(NewPasswordViewController(), animated: true)
    }
}

// MARK: New Password

class NewPasswordViewController: UIViewController{
    
    let stackView = UIStackView()
    let resetPasswordTitle =  UILabel()
    let resetPasswordSubtitle = UILabel()
    let newPasswordTextField = ResetPasswordView(placeholder: "New Password", isSecurityCode: true, onlyKeyboard: false)
    let newPasswordTextFieldConfirmation = ResetPasswordView(placeholder: "Confirm new password", isSecurityCode: true, onlyKeyboard: false)
    let sendButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension NewPasswordViewController{
    private func style(){
        navigationItem.hidesBackButton = true
        view.backgroundColor = .systemBackground
        newPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.axis = .vertical
        
        resetPasswordTitle.translatesAutoresizingMaskIntoConstraints = false
        resetPasswordTitle.textAlignment = .center
        resetPasswordTitle.font = UIFont.boldSystemFont(ofSize: 32)
        resetPasswordTitle.text = "Reset Password"
        
        resetPasswordSubtitle.translatesAutoresizingMaskIntoConstraints = false
        resetPasswordSubtitle.textAlignment = .center
        resetPasswordSubtitle.font = UIFont.boldSystemFont(ofSize: 17)
        resetPasswordSubtitle.textColor = .systemGray
        resetPasswordSubtitle.numberOfLines = 0
        resetPasswordSubtitle.text = "Set the new password for your account so you can login and access all the features."
        
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.tintColor = appColor
        sendButton.configuration = .filled()
        sendButton.setTitle("CONTINUE", for: [])
        sendButton.configuration?.imagePadding = 8
        sendButton.addTarget(self, action: #selector(continueButtonPressed), for: .primaryActionTriggered)
        
        
    }
    
    private func layout(){
        stackView.addArrangedSubview(resetPasswordTitle)
        stackView.addArrangedSubview(resetPasswordSubtitle)
        stackView.addArrangedSubview(newPasswordTextField)
        stackView.addArrangedSubview(newPasswordTextFieldConfirmation)
        stackView.addArrangedSubview(sendButton)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 4)
        ])
    }
}

extension NewPasswordViewController{
    @objc func continueButtonPressed(_ sender: UIButton){
        navigationController?.dismiss(animated: true)
    }
}
