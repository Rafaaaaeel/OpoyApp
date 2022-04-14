//
//  ResetPasword.swift
//  OpoyApp
//
//  Created by Rafael Oliveira on 12/04/22.
//

import Foundation
import UIKit

class ResetPasswordView : UIView{
    
    let stackView = UIStackView()
    let emailTextField = UITextField()
    
    let placeholder: String
    let isSecurityCode: Bool
    let onlyKeyboard: Bool
    
    init(placeholder: String, isSecurityCode: Bool, onlyKeyboard: Bool){
        self.placeholder = placeholder
        self.isSecurityCode = isSecurityCode
        self.onlyKeyboard = onlyKeyboard
        
        super.init(frame: CGRect.zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}


extension ResetPasswordView{
    
    func style(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemFill
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.axis = .vertical
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = placeholder
        emailTextField.isSecureTextEntry = isSecurityCode
        
        if onlyKeyboard{
            emailTextField.keyboardType = UIKeyboardType.numberPad
        }
        
        layer.borderColor = UIColor(red:255/255, green:1/255, blue:1/255, alpha: 0.6).cgColor
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    func layout(){
        
        stackView.addArrangedSubview(emailTextField)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
    }
}

