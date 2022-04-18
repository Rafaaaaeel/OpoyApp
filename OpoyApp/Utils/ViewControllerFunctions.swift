//
//  ViewControllerFunctions.swift
//  OpoyApp
//
//  Created by Rafael Oliveira on 14/04/22.
//

import Foundation

public protocol ViewControllerFunctions{
    func setupView()
    func setupHierarchy()
    func setupConstrants()
    func aditionalSetup()
}

extension ViewControllerFunctions{
    func setupView(){
        setupHierarchy()
        setupConstrants()
        aditionalSetup()
    }
    
    func aditionalSetup() { }
}
