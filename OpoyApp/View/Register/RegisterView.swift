//
//  RegisterView.swift
//  OpoyApp
//
//  Created by Rafael Oliveira on 22/03/22.
//

import Foundation
import UIKit


class RegisterView: UIView{
    

    
    let turnOnAnOff = true
    
    let userDefaulst = UserDefaults()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RegisterView{
    func style(){
        
    }
    
    func layout(){
        
       
    }
}

extension RegisterView: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //guard let name = nameTextField.text, let
    }
}
