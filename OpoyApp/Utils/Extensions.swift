//
//  Extensions.swift
//  OpoyApp
//
//  Created by Rafael Oliveira on 13/04/22.
//

import Foundation


extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
    var isValidPassoword: Bool{
        NSPredicate(format: "SELF MATCHES %@", "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$").evaluate(with: self)
    }
    var isPasswodHasSpecialChar: Bool{
        NSPredicate(format: "SELF MATCHES %@", "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$").evaluate(with: self)
    }
    
    var isPasswodHasUpperCase: Bool{
        NSPredicate(format: "SELF MATCHES %@", "^(?=.*?[A-Z])(?=.*?[0-9])$").evaluate(with: self)
    }
    
    var isPasswodHaslowerCase: Bool{
        NSPredicate(format: "SELF MATCHES %@", "^(?=.*?[a-z])(?=.*?[0-9])$").evaluate(with: self)
    }
    
    var isPasswodHasEightOrPlusChar: Bool{
        NSPredicate(format: "SELF MATCHES %@", "^(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$").evaluate(with: self)
    }
    
    
}
