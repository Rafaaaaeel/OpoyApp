//
//  LoginView.swift
//  OpoyApp
//
//  Created by Rafael Oliveira on 14/03/22.
//

import Foundation
import UIKit


class LoginView: UIView{
    
    let stackView = UIStackView()
    let label = UILabel()
    let textField = UITextField()
    let image = UIImageView()
        
    let imageName: String
    let placeholder : String
    let text: String
    let isSec: Bool

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
    
    init(imageName: String, placeholder: String, text: String, isSecurity: Bool){
        self.imageName = imageName
        self.placeholder = placeholder
        self.text = text
        self.isSec = isSecurity
        
        
        super.init(frame: CGRect.zero)
        
        if !isSec{
            showPasswordButton.isHidden = true
        }
        
        style()
        layout()
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LoginView{
    
    func style(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemFill
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textColor = .systemGray
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: imageName, withConfiguration: UIImage.SymbolConfiguration(scale: .medium))
        image.tintColor = appColor
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = placeholder
        textField.isSecureTextEntry = isSec
        textField.leftView = image
        textField.leftViewMode = .always
        //textField.textColor = appColor
        textField.textAlignment = .left
        textField.delegate = self

        layer.cornerRadius = 15
        clipsToBounds = true
        

        layer.borderColor = UIColor(red:255/255, green:1/255, blue:1/255, alpha: 0.6).cgColor
        
    }
    
    func layout(){
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(textField)

        addSubview(stackView)
        addSubview(showPasswordButton)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 4),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
            
            showPasswordButton.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            showPasswordButton.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: -4)
        ])
        
    }
    
}


extension LoginView{
    
    
    
    @objc func showPassword(_ sender: UIButton){
        didShouldShowOrHidePassword()
    }
    func didShouldShowOrHidePassword(){
        
        if isShow{
            textField.isSecureTextEntry = true
            showPasswordButton.setImage(UIImage(systemName: "eye", withConfiguration: UIImage.SymbolConfiguration(scale: .medium)), for: [])
            isShow = false
            return
        }
        
        if !isShow{
            textField.isSecureTextEntry = false
            showPasswordButton.setImage(UIImage(systemName: "eye.slash", withConfiguration: UIImage.SymbolConfiguration(scale: .medium)), for: [])
            isShow = true
            return
        }
    }
}


extension LoginView: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    
}
