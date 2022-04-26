//
//  ViewController.swift
//  OpoyApp
//
//  Created by Rafael Oliveira on 14/03/22.
//

import UIKit
import FirebaseAuth

let errorColor: UIColor = .systemRed

protocol LoginViewControllerDelegate: AnyObject{
    func didLogin()
}

class LoginViewController: UIViewController {
    
    let loginLabelsStackView = UIStackView()
    
    let loginTitleLabel = UILabel()
    let loginSubTitleLabel = UILabel()
    let loginFieldsStackViews = UIStackView()
    let loginEmailTextField = LoginView(imageName: "envelope", placeholder: "@email.com", text: "E-mail", isSecurity: false)
    let loginPasswordTextField = LoginView(imageName: "lock", placeholder: "******", text: "Password", isSecurity: true)
    let loginErrorMessageLabel = UILabel()
    let loginButton = UIButton(type: .system)
    let forgotPasswordButton = UIButton(type: .system)
    let createAccoutLabel = UILabel()
    let createAccoutButton = UIButton(type: .system)
   
    weak var delegate: LoginViewControllerDelegate?
    
    var email: String?{
        return loginEmailTextField.textField.text
    }
    
    var password: String?{
        return loginPasswordTextField.textField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }

}


extension LoginViewController{
    
    private func setup(){
        style()
        layout()
    }
    private func style(){
        
        
        view.backgroundColor = .systemBackground
        
        loginEmailTextField.translatesAutoresizingMaskIntoConstraints = false

        loginFieldsStackViews.translatesAutoresizingMaskIntoConstraints = false
        loginFieldsStackViews.axis = .vertical
        loginFieldsStackViews.spacing = 30
        
        loginLabelsStackView.translatesAutoresizingMaskIntoConstraints = false
        loginLabelsStackView.axis = .vertical
        loginLabelsStackView.spacing = 8
        
        loginTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        loginTitleLabel.textAlignment = .center
        loginTitleLabel.font = UIFont.boldSystemFont(ofSize: 32)
        loginTitleLabel.text = "Welcome Back"
        
        loginSubTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        loginSubTitleLabel.textAlignment = .center
        loginSubTitleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        loginSubTitleLabel.textColor = .systemGray
        loginSubTitleLabel.text = "Sign to continue"
        
        loginErrorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        loginErrorMessageLabel.textAlignment = .center
        loginErrorMessageLabel.textColor = .systemRed
        loginErrorMessageLabel.text = ""
        loginErrorMessageLabel.isHidden = true
        
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.setTitle("Forgot Password?", for: [])
        forgotPasswordButton.tintColor = appColor
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordPressed), for: .primaryActionTriggered)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.tintColor = appColor
        loginButton.configuration = .filled()
        loginButton.setTitle("Sign In", for: [])
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .primaryActionTriggered)
        loginButton.configuration?.imagePadding = 8

        createAccoutLabel.translatesAutoresizingMaskIntoConstraints = false
        createAccoutLabel.text = "Don't have account?"
        createAccoutLabel.textAlignment = .center
        
        createAccoutButton.translatesAutoresizingMaskIntoConstraints = false
        createAccoutButton.setTitle("Sign up", for: [])
        createAccoutButton.tintColor = appColor
        createAccoutButton.addTarget(self, action: #selector(createNewAccountPressed), for: .primaryActionTriggered)
    
    }
    
    private func layout(){

        
        loginLabelsStackView.addArrangedSubview(loginTitleLabel)
        loginLabelsStackView.addArrangedSubview(loginSubTitleLabel)
    
        loginFieldsStackViews.addArrangedSubview(loginEmailTextField)
        loginFieldsStackViews.addArrangedSubview(loginPasswordTextField)
        loginFieldsStackViews.addArrangedSubview(loginErrorMessageLabel)
        
        view.addSubview(loginLabelsStackView)
        view.addSubview(loginFieldsStackViews)
        view.addSubview(forgotPasswordButton)
        view.addSubview(loginButton)
        view.addSubview(createAccoutLabel)
        view.addSubview(createAccoutButton)
        
        NSLayoutConstraint.activate([
            loginLabelsStackView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 16),
            loginLabelsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: loginLabelsStackView.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            loginFieldsStackViews.topAnchor.constraint(equalToSystemSpacingBelow: loginLabelsStackView.bottomAnchor, multiplier: 4),
            loginFieldsStackViews.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginFieldsStackViews.trailingAnchor, multiplier: 4),
        ])
        
        NSLayoutConstraint.activate([
            forgotPasswordButton.topAnchor.constraint(equalToSystemSpacingBelow: loginFieldsStackViews.bottomAnchor, multiplier: 1),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: loginFieldsStackViews.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalToSystemSpacingBelow: forgotPasswordButton.bottomAnchor, multiplier: 2),
            loginButton.leadingAnchor.constraint(equalTo: loginPasswordTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: loginPasswordTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            createAccoutLabel.bottomAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.bottomAnchor, multiplier: -4),
            createAccoutLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: loginButton.leadingAnchor, multiplier: 6),
            createAccoutButton.centerYAnchor.constraint(equalTo: createAccoutLabel.centerYAnchor),
            createAccoutButton.leadingAnchor.constraint(equalToSystemSpacingAfter: createAccoutLabel.trailingAnchor, multiplier: 1)
        ])
    }
}

extension LoginViewController{
    
    
    @objc func createNewAccountPressed(_ sender: UIButton){
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
    @objc func forgotPasswordPressed(_ sender: UIButton){
        navigationController?.present(UINavigationController(rootViewController: ResetPasswordController()), animated: true, completion: nil)
    }
    
    @objc func loginButtonPressed(_ sender: UIButton){
        errorReset()
        login()
        delegate?.didLogin()
    }
    
    private func login(){
        loginVerification()
    }
    
    func loginVerification(){
        guard let email = email, let password = password else { return }
        
        if email.isEmpty && password.isEmpty{
            emailError()
            passwordError()
            return
        }
        
        if email.isEmpty{
            emailError("E-mail Cannot be blank")
            return
        }
        
        if password.isEmpty{
            passwordError("Password Cannot be blank")
            return
        }
        
        if !email.isValidEmail{
            emailError("E-mail format incorrect")
            return
        }
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] result, error in
            
            guard let strongSelf = self else{
                return
            }
            
            guard error == nil else {
                strongSelf.errorMessageConfig(text: "E-mail or Password Invalid")
                return
            }
            
            strongSelf.loginButton.configuration?.showsActivityIndicator = true
        })
    }

    
    public func errorReset(){
        loginEmailTextField.layer.borderWidth = 0
        loginPasswordTextField.layer.borderWidth = 0
        loginErrorMessageLabel.isHidden = true
    }
    
    public func emailError(_ errorMessage: String = "E-mail / Password cannot be blank"){
        errorMessageConfig(text: errorMessage)
        loginEmailTextField.layer.borderWidth = 1
    }
    
    func passwordError(_ errorMessaage: String = "E-mail / Password cannot be blank"){
        errorMessageConfig(text: errorMessaage)
        loginPasswordTextField.layer.borderWidth = 1
    }
    
    public func errorMessageConfig(text: String){
        loginErrorMessageLabel.isHidden = false
        loginErrorMessageLabel.text = text
        
    }
   
}
extension LoginViewController{
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}





