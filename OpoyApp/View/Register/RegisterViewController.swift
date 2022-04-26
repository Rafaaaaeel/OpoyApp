//
//  RegisterViewController.swift
//  OpoyApp
//
//  Created by Rafael Oliveira on 22/03/22.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseFirestore

protocol RegisterViewControllerDelegate: AnyObject{
    func didCreateAccount()
}

class RegisterViewController: UIViewController{
    
    public lazy var returnToLoginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.left", withConfiguration: UIImage.SymbolConfiguration(scale: .large)), for: [])
        button.isHidden = false
        button.tintColor = appColor
        button.addTarget(self, action: #selector(returnLogin), for: .primaryActionTriggered)
        return button
      
      }()
    
    var mainTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.text = "Join Us"
        return label
    }()
    
    var mainSubTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .systemGray
        label.text = "Create a new account"
        return label
    }()
    
    var name: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Name"
        
        let imageNameTextField = UIImageView()
        imageNameTextField.translatesAutoresizingMaskIntoConstraints = false
        imageNameTextField.tintColor = appColor
        imageNameTextField.image = UIImage(systemName: "person.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
        
        textField.leftView = imageNameTextField
        textField.leftViewMode = .always
        
        return textField
    }()
    
    var email: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
        textField.autocapitalizationType = .none
        
        let imageEmailTextField = UIImageView()
        imageEmailTextField.translatesAutoresizingMaskIntoConstraints = false
        imageEmailTextField.tintColor = appColor
        imageEmailTextField.image = UIImage(systemName: "envelope.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
        
        textField.leftView = imageEmailTextField
        textField.leftViewMode = .always
        return textField
    }()
    
    public lazy var password: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        
        let imagePasswordTextField = UIImageView()
        imagePasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        imagePasswordTextField.tintColor = appColor
        imagePasswordTextField.image = UIImage(systemName: "lock.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
        
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "eye", withConfiguration: UIImage.SymbolConfiguration(scale: .medium)), for: [])
        button.isHidden = false
        button.tintColor = appColor
        button.addTarget(self, action: #selector(showPassword1), for: .primaryActionTriggered)
        
        textField.rightViewMode = .always
        textField.rightView = button
        textField.leftView = imagePasswordTextField
        textField.leftViewMode = .always
        
        
        return textField
    }()
    
    public lazy var confirmPassword: UITextField = {
        let textField = UITextField()
        
        let imagePasswordConfirmationTextField = UIImageView()
        
        imagePasswordConfirmationTextField.translatesAutoresizingMaskIntoConstraints = false
        imagePasswordConfirmationTextField.tintColor = appColor
        imagePasswordConfirmationTextField.image = UIImage(systemName: "lock.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
        
        
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "eye", withConfiguration: UIImage.SymbolConfiguration(scale: .medium)), for: [])
        button.isHidden = false
        button.tintColor = appColor
        button.addTarget(self, action: #selector(showPassword1), for: .primaryActionTriggered)
        
        textField.rightViewMode = .always
        textField.rightView = button
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Confirm password"
        textField.isSecureTextEntry = true
        textField.leftView = imagePasswordConfirmationTextField
        textField.leftViewMode = .always
        return textField
    }()
    
    var passwordRuleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.numberOfLines = 0
        label.text = """
        * Use at least 8 characters
        * Use upper and lower case characters
        * Use 1 or more numbers
        * Use special characters
        """

        return label
    }()
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        return stackView
    }()
    
    lazy var createButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = appColor
        button.configuration = .filled()
        button.setTitle("CREATE ACCOUNT", for: [])
        button.addTarget(self, action: #selector(createNewAccount), for: .primaryActionTriggered)
        button.configuration?.imagePadding = 8
        button.isEnabled = false
        return button
    }()

    var alreadyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Already have a account?"
        label.textAlignment = .center
        return label
    }()
    
    lazy var returnToLogin: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = appColor
        button.setTitle("Login", for: [])
        button.addTarget(self, action: #selector(alreadyHasAccount), for: .primaryActionTriggered)
        return button
    }()
    
    var nameLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemFill
        return view
    }()
    
    var emailLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemFill
        return view
    }()
    
    var passwordLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemFill
        return view
    }()
    
    var confirmPasswordLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemFill
        return view
    }()
    
    
    var isShow: Bool = false
    
    weak var delegate: RegisterViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
}

extension RegisterViewController: ViewControllerFunctions{
    func setupHierarchy() {
        view.addSubview(returnToLoginButton)
        view.addSubview(mainTitle)
        view.addSubview(mainSubTitle)
        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(nameLine)
        stackView.addArrangedSubview(email)
        stackView.addArrangedSubview(emailLine)
        stackView.addArrangedSubview(password)
        stackView.addArrangedSubview(passwordLine)
        stackView.addArrangedSubview(confirmPassword)
        stackView.addArrangedSubview(confirmPasswordLine)
        stackView.addArrangedSubview(passwordRuleLabel)
        stackView.addArrangedSubview(createButton)
        
        view.addSubview(stackView)
        view.addSubview(alreadyLabel)
        view.addSubview(returnToLogin)
    }
    
    func setupConstrants() {
        NSLayoutConstraint.activate([
            returnToLoginButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            returnToLoginButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            mainTitle.topAnchor.constraint(equalToSystemSpacingBelow: returnToLoginButton.bottomAnchor, multiplier: 4),
            mainTitle.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: mainTitle.trailingAnchor, multiplier: 4),
            
            mainSubTitle.topAnchor.constraint(equalToSystemSpacingBelow: mainTitle.bottomAnchor, multiplier: 2),
            mainSubTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: mainSubTitle.bottomAnchor, multiplier: 4),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 4)
            
        ])
        
        NSLayoutConstraint.activate([
            alreadyLabel.topAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 23),
            alreadyLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: stackView.leadingAnchor, multiplier: 5),
            
            returnToLogin.leadingAnchor.constraint(equalToSystemSpacingAfter: alreadyLabel.trailingAnchor, multiplier: 1),
            returnToLogin.centerYAnchor.constraint(equalTo: alreadyLabel.centerYAnchor)
    
        ])
        
        nameLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        emailLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        passwordLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        confirmPasswordLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    
    func aditionalSetup() {
        navigationItem.hidesBackButton = true
        view.backgroundColor = .systemBackground
        name.delegate = self
        email.delegate = self
        password.delegate = self
        confirmPassword.delegate = self
    }
    
}

extension RegisterViewController{
    @objc func showPassword1(_ sender: UIButton){
        didShouldShowOrHidePassword()
    }
    
    func didShouldShowOrHidePassword(){
        
        if isShow{
            password.isSecureTextEntry = true
            let img = UIImageView()
            img.image = UIImage(systemName: "eye", withConfiguration: UIImage.SymbolConfiguration(scale: .medium))
            password.rightView = img
            isShow = false
            return
        }
        
        if !isShow{
            password.isSecureTextEntry = false
            let img = UIImageView()
            img.image = UIImage(systemName: "eye.slash", withConfiguration: UIImage.SymbolConfiguration(scale: .medium))
            password.rightView = img
            isShow = true
            return
        }
    }
    
    @objc func alreadyHasAccount(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func returnLogin(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func createNewAccount(_ sender: UIButton){
        createAccount()
        navigationController?.popViewController(animated: true)
    }
    
    func createAccount(){
        guard let name = name.text, let email = email.text, let password = password.text else { return }
        
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: { (result, error) in
            
            guard error == nil else {
                print("Sorry something went wrong")
                return
            }
            
            let db = Firestore.firestore()
            
            db.collection("users").addDocument(data: [
                "name":name,
                "email":email,
                "uid": result!.user.uid
            ]) { Error in
                if Error != nil{
                    print(Error?.localizedDescription)
                }
            }

            
        })
    }
    
}

extension RegisterViewController:UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        resetFields()
        
        guard let name = name.text, let email = email.text, let password = password.text, let confirmPassword = confirmPassword.text else { return }

        
        if !name.lenghIsRight{
            print("Foo - Less then 4")
        }
        
        if name.isEmpty && email.isEmpty && password.isEmpty && confirmPassword.isEmpty {
            nameLine.backgroundColor = .systemRed
            emailLine.backgroundColor = .systemRed
            passwordLine.backgroundColor = .systemRed
            confirmPasswordLine.backgroundColor = .systemRed
            return
        }
        
        if  email.isEmpty && password.isEmpty && confirmPassword.isEmpty {
            emailLine.backgroundColor = .systemRed
            passwordLine.backgroundColor = .systemRed
            confirmPasswordLine.backgroundColor = .systemRed
            return
        }
        
        
        if  password.isEmpty && confirmPassword.isEmpty {
            passwordLine.backgroundColor = .systemRed
            confirmPasswordLine.backgroundColor = .systemRed
            return
        }
        
        if !password.isValidPassoword{
            passwordRuleLabel.textColor = .systemRed
            return
        }        
        
        if name.isEmpty{
            nameLine.backgroundColor = .systemRed
            return
        }
        
        if email.isEmpty{
            emailLine.backgroundColor = .systemRed
            return
        }
        
        if password.isEmpty{
            passwordLine.backgroundColor = .systemRed
            return
        }
        
        if confirmPassword.isEmpty{
            confirmPasswordLine.backgroundColor = .systemRed
            return
        }
        
        if password != confirmPassword{
            passwordLine.backgroundColor = .systemRed
            confirmPasswordLine.backgroundColor = .systemRed
            return
        }
        
        
        if !email.isValidEmail {
            emailLine.backgroundColor = .systemRed
            return
        }
        
        createButton.isEnabled = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return name.resignFirstResponder()
    }
}

extension RegisterViewController{
    
    func resetFields(){
        nameLine.backgroundColor = .secondarySystemFill
        emailLine.backgroundColor = .secondarySystemFill
        passwordLine.backgroundColor = .secondarySystemFill
        confirmPasswordLine.backgroundColor = .secondarySystemFill
        passwordRuleLabel.textColor = .systemGray
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
}
