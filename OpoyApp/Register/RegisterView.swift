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
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 70
        stackView.backgroundColor = .cyan
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.placeholder = "Name"
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = "Email"
        
        phoneNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTextField.placeholder = "Phone"
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        
        passwordConfirmationTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordConfirmationTextField.placeholder = "Confirm password"
        
    }
    
    func layout(){
        
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(phoneNumberTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(passwordConfirmationTextField)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 4),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2)
            
        ])
        
        
    }
}
