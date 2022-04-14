//
//  LoginViewController2.swift
//  OpoyApp
//
//  Created by Rafael Oliveira on 13/04/22.
//

import UIKit

class LoginViewController2: UIViewController {

    let loginScreen = LoginViewScreen()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
    }
    
    func layout(){
        loginScreen.translatesAutoresizingMaskIntoConstraints = false
    
        view.addSubview(loginScreen)
        
        NSLayoutConstraint.activate([
            loginScreen.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            loginScreen.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginScreen.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loginScreen.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

}
