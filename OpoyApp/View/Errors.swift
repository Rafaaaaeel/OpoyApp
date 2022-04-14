//
//  Errors.swift
//  OpoyApp
//
//  Created by Rafael Oliveira on 13/04/22.
//

import Foundation

public protocol FieldsErrors {
    func emailError(_ errorMessage: String)
    func passwordError(_ errorMessaage: String)
    func errorMessageConfig(text: String)
}
