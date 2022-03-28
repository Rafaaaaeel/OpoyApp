//
//  ViewController.swift
//  OpoyApp
//
//  Created by Rafael Oliveira on 14/03/22.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject{
    func didCreateAnotherAccount()
    
    func didLogin()
}

class LoginViewController: UIViewController {
    
    let userImage = UIImageView()
    let welcomeMessageLabel = UILabel()
    let moveOnMessageLabel = UILabel()
    let emailView = LoginView(imageName: "envelope.fill", placeholder: "   @email.com", text: "Email", isSecurity: false)
    let passwordView = LoginView(imageName: "r.fill", placeholder: "   Password", text: "", isSecurity: true)
    let errorMessage = UILabel()
    let forgotPasswordButton = UIButton(type: .system)
    let createAccoutLabel = UILabel()
    let createAccoutButton = UIButton(type: .system)
    let loginButton = UIButton(type: .system)
    
    weak var delegate: LoginViewControllerDelegate?
    
    var email: String?{
        return emailView.textField.text
    }
    
    var password: String?{
        return passwordView.textField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }

}


extension LoginViewController{
    private func style(){
        emailView.translatesAutoresizingMaskIntoConstraints = false
        
        welcomeMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeMessageLabel.textAlignment = .center
        welcomeMessageLabel.font = UIFont.boldSystemFont(ofSize: 32)
        welcomeMessageLabel.text = "Welcome Back"
        
        moveOnMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        moveOnMessageLabel.textAlignment = .center
        moveOnMessageLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        moveOnMessageLabel.textColor = .systemGray
        moveOnMessageLabel.text = "Sign to continue"
        
        
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userImage.image = UIImage(named: "user-icon")
        userImage.contentMode = .scaleAspectFit
        
        errorMessage.translatesAutoresizingMaskIntoConstraints = false
        errorMessage.textAlignment = .center
        errorMessage.textColor = .systemRed
        
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.setTitle("Forgot Password?", for: [])
        forgotPasswordButton.tintColor = appColor
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.tintColor = appColor
        loginButton.configuration = .filled()
        loginButton.setTitle("LOGIN", for: [])
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .primaryActionTriggered)
        loginButton.configuration?.imagePadding = 8
        
        createAccoutLabel.translatesAutoresizingMaskIntoConstraints = false
        createAccoutLabel.text = "Don't have account?"
        createAccoutLabel.textAlignment = .center
        
        createAccoutButton.translatesAutoresizingMaskIntoConstraints = false
        createAccoutButton.setTitle("create a new account", for: [])
        createAccoutButton.tintColor = appColor
        createAccoutButton.addTarget(self, action: #selector(createNewAccountPressed), for: .primaryActionTriggered)
        
      
    }
    
    private func layout(){
        view.addSubview(userImage)
        view.addSubview(welcomeMessageLabel)
        view.addSubview(moveOnMessageLabel)
        view.addSubview(emailView)
        view.addSubview(passwordView)
        view.addSubview(errorMessage)
        view.addSubview(forgotPasswordButton)
        view.addSubview(loginButton)
        view.addSubview(createAccoutLabel)
        view.addSubview(createAccoutButton)
        
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 5),
            userImage.heightAnchor.constraint(equalToConstant: 130),
            userImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            welcomeMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: userImage.bottomAnchor, multiplier: 1),
            welcomeMessageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            welcomeMessageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            moveOnMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: welcomeMessageLabel.bottomAnchor, multiplier: 1),
            moveOnMessageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moveOnMessageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            emailView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emailView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: emailView.trailingAnchor, multiplier: 4),
            
            passwordView.topAnchor.constraint(equalToSystemSpacingBelow: emailView.bottomAnchor, multiplier: 5),
            passwordView.leadingAnchor.constraint(equalTo: emailView.leadingAnchor),
            passwordView.trailingAnchor.constraint(equalTo: emailView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            errorMessage.topAnchor.constraint(equalToSystemSpacingBelow: passwordView.bottomAnchor, multiplier: 1),
            errorMessage.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor),
            errorMessage.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            forgotPasswordButton.topAnchor.constraint(equalToSystemSpacingBelow: passwordView.bottomAnchor, multiplier: 3),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor)
        
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalToSystemSpacingBelow: forgotPasswordButton.bottomAnchor, multiplier: 3),
            loginButton.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
        
        NSLayoutConstraint.activate([
            createAccoutLabel.topAnchor.constraint(equalToSystemSpacingBelow: loginButton.bottomAnchor, multiplier: 3),
            createAccoutLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: loginButton.leadingAnchor, multiplier: 1),
            
            
            createAccoutButton.topAnchor.constraint(equalToSystemSpacingBelow: loginButton.bottomAnchor, multiplier: 2.5),
            createAccoutButton.leadingAnchor.constraint(equalToSystemSpacingAfter: createAccoutLabel.trailingAnchor, multiplier: 1)
        ])
    }
}

extension LoginViewController{
    @objc func loginButtonPressed(_ sender: UIButton){
        errorMessage.isHidden = true
        login()
    }
    
    @objc func createNewAccountPressed(_ sender: UIButton){
        delegate?.didCreateAnotherAccount()
    }
    private func login(){
        loginVerification()
    }
    
    private func loginVerification(){
        guard let email = email, let password = password else { return }
        
        if email.isEmpty || password.isEmpty{
            errorMessageConfig(text: "Email / Password Cannot be blank")
            return
        }
        if !email.contains("@"){
            errorMessageConfig(text: "Email format incorrect")
            return
        }
        // Hardcode
        
        if email == "Rafaelo@gmail.com" && password == "wagner46"{
            loginButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        } else {
            errorMessageConfig(text: "Email / Password incorrect")
        }
        
    }
    private func errorMessageConfig(text: String){
        errorMessage.isHidden = false
        errorMessage.text = text
    }
}
