//
//  RegisterViewController.swift
//  OpoyApp
//
//  Created by Rafael Oliveira on 22/03/22.
//

import Foundation
import UIKit

protocol RegisterViewControllerDelegate: AnyObject{
    func didCreateAccount()
}


class RegisterViewController: UIViewController{
    
    let image = UIImageView(image: UIImage(systemName: "arrow", withConfiguration: UIImage.SymbolConfiguration(scale: .large)))
    let createAccountTitlelabel = UILabel()
    let createNewAccountSubTitle = UILabel()
    let registerView = RegisterView()
    let createAccountButton = UIButton(type: .system)
    let alreadyAccountLabel = UILabel()
    let returnToLoginScreen = UIButton(type: .system)
    let arrowToReturn = UIButton(type: .system)
    
    var users: [User] = []
    
    
    weak var delegate: RegisterViewControllerDelegate?
    
    
    var name: String?{
        return registerView.nameTextField.text
    }
    
    var email: String?{
        return registerView.emailTextField.text
    }
    
    var phone: String?{
        return registerView.phoneNumberTextField.text
    }
    
    var password: String?{
        return registerView.passwordTextField.text
    }
    
    var passwordConfirmation: String?{
        return registerView.passwordConfirmationTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}



extension RegisterViewController{
    
    func style(){
        
        navigationItem.hidesBackButton = true
        
        view.backgroundColor = .systemBackground
        registerView.translatesAutoresizingMaskIntoConstraints = false
        
        createAccountTitlelabel.translatesAutoresizingMaskIntoConstraints = false
        createAccountTitlelabel.textAlignment = .center
        createAccountTitlelabel.font = UIFont.boldSystemFont(ofSize: 32)
        createAccountTitlelabel.text = "Create Account"
        
        createNewAccountSubTitle.translatesAutoresizingMaskIntoConstraints = false
        createNewAccountSubTitle.textAlignment = .center
        createNewAccountSubTitle.font = UIFont.boldSystemFont(ofSize: 17)
        createNewAccountSubTitle.textColor = .systemGray
        createNewAccountSubTitle.text = "Create a new account"
        
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        createAccountButton.tintColor = appColor
        createAccountButton.configuration = .filled()
        createAccountButton.setTitle("CREATE ACCOUNT", for: [])
        createAccountButton.addTarget(self, action: #selector(createNewAccount), for: .primaryActionTriggered)
        createAccountButton.configuration?.imagePadding = 8
        
        alreadyAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        alreadyAccountLabel.text = "Already have a account?"
        alreadyAccountLabel.textAlignment = .center
        
        returnToLoginScreen.translatesAutoresizingMaskIntoConstraints = false
        returnToLoginScreen.tintColor = appColor
        returnToLoginScreen.setTitle("Login", for: [])
        returnToLoginScreen.addTarget(self, action: #selector(alreadyHasAccount), for: .primaryActionTriggered)
        
    }
    
    func layout(){
        view.addSubview(createAccountTitlelabel)
        view.addSubview(createNewAccountSubTitle)
        view.addSubview(registerView)
        view.addSubview(createAccountButton)
        view.addSubview(alreadyAccountLabel)
        view.addSubview(returnToLoginScreen)
        
        NSLayoutConstraint.activate([
            createAccountTitlelabel.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            createAccountTitlelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            createNewAccountSubTitle.topAnchor.constraint(equalToSystemSpacingBelow: createAccountTitlelabel.bottomAnchor, multiplier: 2),
            createNewAccountSubTitle.leadingAnchor.constraint(equalTo: createAccountTitlelabel.leadingAnchor),
            createNewAccountSubTitle.trailingAnchor.constraint(equalTo: createAccountTitlelabel.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            registerView.topAnchor.constraint(equalToSystemSpacingBelow: createNewAccountSubTitle.bottomAnchor, multiplier: 5),
            registerView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            registerView.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: 0)
        ])
        
        NSLayoutConstraint.activate([
            createAccountButton.topAnchor.constraint(equalToSystemSpacingBelow: registerView.bottomAnchor, multiplier: 4),
            createAccountButton.leadingAnchor.constraint(equalTo: registerView.leadingAnchor, constant: 16),
            createAccountButton.trailingAnchor.constraint(equalTo: registerView.trailingAnchor, constant: -32),
            createAccountButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            alreadyAccountLabel.topAnchor.constraint(equalToSystemSpacingBelow: createAccountButton.bottomAnchor, multiplier: 6),
            alreadyAccountLabel.centerXAnchor.constraint(equalTo: createAccountTitlelabel.centerXAnchor, constant: -20),
            
            returnToLoginScreen.leadingAnchor.constraint(equalToSystemSpacingAfter: alreadyAccountLabel.trailingAnchor, multiplier: 1),
            returnToLoginScreen.centerYAnchor.constraint(equalTo: alreadyAccountLabel.centerYAnchor)
            
        ])
    }
}

extension RegisterViewController{
    @objc func alreadyHasAccount(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func createNewAccount(_ sender: UIButton){
        delegate?.didCreateAccount()
        registerUser()
        print(users)
    }
    private func registerUser(){
        guard let name = name, let email = email, let phone = phone, let password = password, let _ = passwordConfirmation else { return }
        
        let user1 = User(name: name, email: email, phone: phone, password: password)
        
        navigationController?.popViewController(animated: true)
        
        users.append(user1)
        
        
    }

}


