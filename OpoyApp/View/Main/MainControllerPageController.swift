//
//  MainControllerPage.swift
//  OpoyApp
//
//  Created by Rafael Oliveira on 11/04/22.
//

import Foundation
import UIKit

class MainViewController: UIViewController{
    
    public var mainImage: UIImageView = {
       let image = UIImageView()
        let imageName = UIImage(named: "hello-message")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = imageName
        image.setContentHuggingPriority(.defaultLow, for: .vertical)
        return image
    }()
    
    
    
    public lazy var signIn: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.setTitle("log In", for: [])
        button.addTarget(self, action: #selector(signInPressed), for: .primaryActionTriggered)
        
        return button
    }()
    
    public lazy var signUp: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = appColor
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(red:255/255, green:255/255, blue:255/255, alpha: 1).cgColor
        button.layer.cornerRadius = 10
        button.setTitle("Getting Started", for: [])
        button.configuration = .filled()
        button.addTarget(self, action: #selector(signUpPressed), for: .primaryActionTriggered)
        
        return button
    }()
    
    public var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    public var alreadyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Already have a account?"
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

}

extension MainViewController: ViewControllerFunctions{
    func setupHierarchy() {
        
        view.addSubview(mainImage)
        stackView.addArrangedSubview(signUp)
        view.addSubview(stackView)
        view.addSubview(signIn)
        view.addSubview(alreadyLabel)
    }
    
    func setupConstrants() {
        
        NSLayoutConstraint.activate([
            mainImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: mainImage.bottomAnchor, multiplier: 2),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 4),
            
            alreadyLabel.topAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 2),
            alreadyLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 10),
            
            signIn.centerYAnchor.constraint(equalTo: alreadyLabel.centerYAnchor),
            signIn.leadingAnchor.constraint(equalToSystemSpacingAfter: alreadyLabel.trailingAnchor, multiplier: 1)
            
        ])
    }
    
    func aditionalSetup() {
        view.backgroundColor = appColor
    }
    
    
}


extension MainViewController{
    @objc func signInPressed(_ sender: UIButton){
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
    @objc func signUpPressed(_ sender: UIButton){
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
     
}
