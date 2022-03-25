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
        
        
    }
    
    func layout(){
        view.addSubview(createAccountTitlelabel)
        view.addSubview(createNewAccountSubTitle)
        view.addSubview(registerView)
        view.addSubview(createAccountButton)

        
        NSLayoutConstraint.activate([
            createAccountTitlelabel.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 6),
            createAccountTitlelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            createNewAccountSubTitle.topAnchor.constraint(equalToSystemSpacingBelow: createAccountTitlelabel.bottomAnchor, multiplier: 1),
            createNewAccountSubTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            registerView.topAnchor.constraint(equalToSystemSpacingBelow: createAccountTitlelabel.bottomAnchor, multiplier: 6),
            registerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            registerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            createAccountButton.bottomAnchor.constraint(equalToSystemSpacingBelow: registerView.topAnchor, multiplier: 3)
        ])
    }
}
