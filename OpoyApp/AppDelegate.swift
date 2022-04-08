//
//  AppDelegate.swift
//  OpoyApp
//
//  Created by Rafael Oliveira on 14/03/22.
//

import UIKit

let appColor : UIColor = .systemGreen

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    let loginViewController = LoginViewController()
    let registerViewController = RegisterViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions lauchoptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool{
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground

        loginViewController.delegate = self
        registerViewController.delegate = self
        
        window?.rootViewController = loginViewController
        
        return true
    }

}


extension AppDelegate: LoginViewControllerDelegate{
    
    func setRootViewController(_ vc: UIViewController, animeted: Bool = true){
        guard animeted, let window = self.window else{
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
        
    }
    
    
    func didLogin() {
        //
    }
    
    func didCreateAnotherAccount() {
        setRootViewController(registerViewController)
    }
}

extension AppDelegate: RegisterViewControllerDelegate{
    func didCreateAccount(){
        print("Creating account")
    }
    
    func didAlreadyHasAccount(){
        setRootViewController(loginViewController)
    }
}
