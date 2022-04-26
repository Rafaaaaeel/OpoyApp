//
//  LoggedViewController.swift
//  OpoyApp
//
//  Created by Rafael Oliveira on 18/04/22.
//

import UIKit
import FirebaseAuth

protocol LoggedViewControllerDelegate: AnyObject{
    func didLogOut()
}

class LoggedViewController: UIViewController {

    public lazy var signOutButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = appColor
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(red:255/255, green:255/255, blue:255/255, alpha: 1).cgColor
        button.layer.cornerRadius = 10
        button.setTitle("Log Out", for: [])
        button.configuration = .filled()
        button.addTarget(self, action: #selector(signOutPressed), for: .primaryActionTriggered)
        return button
    }()
    
    weak var delegate: LoggedViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupMain()
    }
    
}
extension LoggedViewController{
    func setupMain() {
        
        view.backgroundColor = appColor
//        view.addSubview(welcomeLabel)
        view.addSubview(signOutButton)
        
        NSLayoutConstraint.activate([
            signOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signOutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
        ])
    }
}


extension LoggedViewController{
    @objc func signOutPressed(_ sender: UIButton){
        
        do{
            
            try FirebaseAuth.Auth.auth().signOut()
            delegate?.didLogOut()
            
        }catch{
            print("Error")
        }
    }
}
