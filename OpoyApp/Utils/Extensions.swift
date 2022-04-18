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
    
    var lenghIsRight: Bool{
        NSPredicate(format: "SELF MATCHES %@", "^[^-\\s][\\p{L}\\-'\\s]{2,26}$").evaluate(with: self)
    }

    
}
