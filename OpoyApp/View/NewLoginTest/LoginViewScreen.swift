//
//  LoginViewScreen.swift
//  OpoyApp
//
//  Created by Rafael Oliveira on 13/04/22.
//

import UIKit

class LoginViewScreen: UIView {
//
//    let loginLabelsStackView = UIStackView()
//    let loginUserImage = UIImageView()
//    let loginTitleLabel = UILabel()
//    let loginSubTitleLabel = UILabel()
//    let loginFieldsStackViews = UIStackView()
//    let loginEmailTextField = LoginView(imageName: "envelope", placeholder: "@email.com", text: "E-mail", isSecurity: false)
//    let loginPasswordTextField = LoginView(imageName: "lock", placeholder: "******", text: "Password", isSecurity: true)
//    let loginErrorMessageLabel = UILabel()
//    let loginButton = UIButton(type: .system)
//    let forgotPasswordButton = UIButton(type: .system)
//    let createAccoutLabel = UILabel()
//    let createAccoutButton = UIButton(type: .system)
//
//    let stackView = UIStackView()
//    let label = UILabel()
//    let textField = UITextField()
//    let image = UIImageView()
    
    private var userImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "user-icon")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private var topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.text = "Welcome Back"
        return label
    }()
    
    private var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .systemGray
        label.text = "Sign to continue"
        return label
    }()
    
    private var fieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .secondarySystemFill
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.layer.cornerRadius = 15
        stackView.clipsToBounds = true
        return stackView
    }()
    
    private var emailStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
  
        return stackView
    }()
    
    private var passwordStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .secondarySystemFill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.layer.cornerRadius = 15
        stackView.clipsToBounds = true
        return stackView
    }()
    
    private var inputEmailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "E-mail"
        label.textColor = .systemGray
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        return label
    }()
    
    private var inputPasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password"
        label.textColor = .systemGray
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        return label
    }()
    
    private var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "@email.com"
        let image = UIImageView()
        image.image = UIImage(systemName: "envelope", withConfiguration: UIImage.SymbolConfiguration(scale: .medium))
        image.tintColor = appColor
        textField.leftView = image
        textField.leftViewMode = .always
        return textField
    }()
    
    private var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "******"
        textField.isSecureTextEntry = true
        textField.leftViewMode = .always
        let image = UIImageView()
        image.image = UIImage(systemName: "lock", withConfiguration: UIImage.SymbolConfiguration(scale: .medium))
        image.tintColor = appColor
        textField.leftView = image
        return textField
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    
        layout()

    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func layout(){


        topStackView.addArrangedSubview(userImage)
        topStackView.addArrangedSubview(titleLabel)
        topStackView.addArrangedSubview(subTitleLabel)

        
        emailStackView.addArrangedSubview(inputEmailLabel)
        emailStackView.addArrangedSubview(emailTextField)
        
        passwordStackView.addArrangedSubview(inputPasswordLabel)
        passwordStackView.addArrangedSubview(passwordTextField)
        
        fieldStackView.addArrangedSubview(emailStackView)
        
        addSubview(topStackView)
        addSubview(fieldStackView)
        
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 14),
            topStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: topStackView.trailingAnchor, multiplier: 1),
            
        ])
        
        NSLayoutConstraint.activate([
            emailStackView.heightAnchor.constraint(equalToConstant: 70),
            
            fieldStackView.topAnchor.constraint(equalToSystemSpacingBelow: topStackView.bottomAnchor, multiplier: 2),
            fieldStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 4),
            trailingAnchor.constraint(equalToSystemSpacingAfter: fieldStackView.trailingAnchor, multiplier: 4)
        ])

    }

}

