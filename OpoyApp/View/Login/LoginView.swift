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
  
    
    init(imageName: String, placeholder: String, text: String, isSecurity: Bool){
        self.imageName = imageName
        self.placeholder = placeholder
        self.text = text
        self.isSec = isSecurity
        
        super.init(frame: CGRect.zero)
        
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

        layer.cornerRadius = 15
        clipsToBounds = true
        

        layer.borderColor = UIColor(red:255/255, green:1/255, blue:1/255, alpha: 0.6).cgColor
        
    }
    
    func layout(){
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(textField)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 4),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        
    }
    
}


