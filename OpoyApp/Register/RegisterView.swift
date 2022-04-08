//
//  RegisterView.swift
//  OpoyApp
//
//  Created by Rafael Oliveira on 22/03/22.
//

import Foundation
import UIKit


class RegisterView: UIView{
    
    let stackView = UIStackView()
    let nameTextField = UITextField()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let passwordConfirmationTextField = UITextField()
    let phoneNumberTextField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RegisterView{
    func style(){
        
        let imageNameTextField = UIImageView()
        let imageEmailTextField = UIImageView()
        let imagePhoneNumberTextField = UIImageView()
        let imagePasswordTextField = UIImageView()
        let imagePasswordConfirmationTextField = UIImageView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 70
        
        imageNameTextField.translatesAutoresizingMaskIntoConstraints = false
        imageNameTextField.tintColor = appColor
        imageNameTextField.image = UIImage(systemName: "person.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
        
        imageEmailTextField.translatesAutoresizingMaskIntoConstraints = false
        imageEmailTextField.tintColor = appColor
        imageEmailTextField.image = UIImage(systemName: "envelope.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
        
        imagePhoneNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        imagePhoneNumberTextField.tintColor = appColor
        imagePhoneNumberTextField.image = UIImage(systemName: "phone.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
        
        imagePasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        imagePasswordTextField.tintColor = appColor
        imagePasswordTextField.image = UIImage(systemName: "lock.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
        
        imagePasswordConfirmationTextField.translatesAutoresizingMaskIntoConstraints = false
        imagePasswordConfirmationTextField.tintColor = appColor
        imagePasswordConfirmationTextField.image = UIImage(systemName: "lock.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
        
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.placeholder = "Name"
        nameTextField.leftView = imageNameTextField
        nameTextField.leftViewMode = .always
        
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = "Email"
        emailTextField.leftView = imageEmailTextField
        emailTextField.leftViewMode = .always
        
        phoneNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTextField.placeholder = "Phone"
        phoneNumberTextField.leftView = imagePhoneNumberTextField
        phoneNumberTextField.leftViewMode = .always
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.leftView = imagePasswordTextField
        passwordTextField.leftViewMode = .always
        
        passwordConfirmationTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordConfirmationTextField.placeholder = "Confirm password"
        passwordConfirmationTextField.isSecureTextEntry = true
        passwordConfirmationTextField.leftView = imagePasswordConfirmationTextField
        passwordConfirmationTextField.leftViewMode = .always
    }
    
    func layout(){
        
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(phoneNumberTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(passwordConfirmationTextField)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 4),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
    }
}

