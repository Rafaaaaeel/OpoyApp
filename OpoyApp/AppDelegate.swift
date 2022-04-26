//
//  AppDelegate.swift
//  OpoyApp
//
//  Created by Rafael Oliveira on 14/03/22.
//

import UIKit
import Firebase
import FirebaseAuth

let appColor : UIColor = .systemBlue

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let registerViewController = RegisterViewController()
    let loginViewController = LoginViewController()
    let mainPageViewController = MainViewController()
    let navigationController = UINavigationController(rootViewController: MainViewController())
    let loggedViewController = LoggedViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions lauchoptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool{

        FirebaseApp.configure()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground


        registerViewController.delegate = self
        loggedViewController.delegate = self
        loginViewController.delegate = self

        
        window?.rootViewController = navigationController
        
        let user = Auth.auth().currentUser?.email
        print("Foo - \(user)")
//        window?.rootViewController = registerViewController
        
        return true
    }

}


extension AppDelegate{
    
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
    
}

extension AppDelegate: RegisterViewControllerDelegate{
    func didCreateAccount(){
        setRootViewController(loginViewController)
    }
}

extension AppDelegate: LoggedViewControllerDelegate{
    func didLogOut() {
       setRootViewController(navigationController)
    }
}

extension AppDelegate: LoginViewControllerDelegate{
    func didLogin() {
        
        if Auth.auth().currentUser != nil {
            setRootViewController(loggedViewController)
        }
    }
}
