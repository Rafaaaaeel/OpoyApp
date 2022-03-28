//
//  RegisterViewController.swift
//  OpoyApp
//
//  Created by Rafael Oliveira on 22/03/22.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController{
    
    let image = UIImageView(image: UIImage(systemName: "arrow", withConfiguration: UIImage.SymbolConfiguration(scale: .large)))
    let createAccountTitlelabel = UILabel()
    let createNewAccountSubTitle = UILabel()
    let registerView = RegisterView()
    let createAccountButton = UIButton(type: .system)
    let alreadyAccountLabel = UILabel()
    let returnToLoginScreen = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}



extension RegisterViewController{
    
    func style(){

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
        //createAccountTitlelabel.addTarget(self, action: #selector(loginButtonPressed), for: .primaryActionTriggered)
        createAccountButton.configuration?.imagePadding = 8
        
        alreadyAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        alreadyAccountLabel.text = "Already have a account?"
        alreadyAccountLabel.textAlignment = .center
        
        returnToLoginScreen.translatesAutoresizingMaskIntoConstraints = false
        returnToLoginScreen.tintColor = appColor
        returnToLoginScreen.setTitle("Login", for: [])
        
    }
    
    func layout(){
        view.addSubview(createAccountTitlelabel)
        view.addSubview(createNewAccountSubTitle)
        view.addSubview(registerView)
        view.addSubview(createAccountButton)
        view.addSubview(alreadyAccountLabel)
        view.addSubview(returnToLoginScreen)
        
        NSLayoutConstraint.activate([
            createAccountTitlelabel.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 8),
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
