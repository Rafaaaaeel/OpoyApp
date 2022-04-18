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
    
    var isShow: Bool = false
    
    public lazy var showPasswordButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "eye", withConfiguration: UIImage.SymbolConfiguration(scale: .medium)), for: [])
        button.isHidden = false
        button.tintColor = appColor
        button.addTarget(self, action: #selector(showPassword), for: .primaryActionTriggered)
        return button
      
      }()
    
    init(placeholder: String, isSecurityCode: Bool, onlyKeyboard: Bool){
        self.placeholder = placeholder
        self.isSecurityCode = isSecurityCode
        self.onlyKeyboard = onlyKeyboard
        
        
        super.init(frame: CGRect.zero)
        
        if !isSecurityCode{
            showPasswordButton.isHidden = true
        }
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
        emailTextField.delegate = self
        
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
        addSubview(showPasswordButton)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
            
            showPasswordButton.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            showPasswordButton.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: -4)
        ])
    }
}

extension ResetPasswordView{
    
    @objc func showPassword(_ sender: UIButton){
        didShouldShowOrHidePassword()
    }
    func didShouldShowOrHidePassword(){
        
        if isShow{
            emailTextField.isSecureTextEntry = true
            showPasswordButton.setImage(UIImage(systemName: "eye", withConfiguration: UIImage.SymbolConfiguration(scale: .medium)), for: [])
            isShow = false
            return
        }
        
        if !isShow{
            emailTextField.isSecureTextEntry = false
            showPasswordButton.setImage(UIImage(systemName: "eye.slash", withConfiguration: UIImage.SymbolConfiguration(scale: .medium)), for: [])
            isShow = true
            return
        }
    }
}


extension ResetPasswordView: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return emailTextField.resignFirstResponder()
    }
    
    
}
