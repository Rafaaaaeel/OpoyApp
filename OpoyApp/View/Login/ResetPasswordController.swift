//
//  ResetPassword.swift
//  OpoyApp
//
//  Created by Rafael Oliveira on 12/04/22.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

// MARK: Reset
class ResetPasswordController: UIViewController{
    
    let stackView = UIStackView()
    let forgotPasswordTitle =  UILabel()
    let forgotPasswordSbTitle = UILabel()
    let resetView = ResetPasswordView(placeholder: "Email", isSecurityCode: false, onlyKeyboard: false)
    let sendButton = UIButton(type: .system)
    
    public var forgotImage: UIImageView = {
       let image = UIImageView()
        let imageName = UIImage(named: "fgt-password")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = imageName
        image.frame = CGRect(x: 30, y: 30, width: 200, height: 30)
        image.setContentHuggingPriority(.defaultLow, for: .vertical)
        return image
    }()
    
    public var errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .systemRed
        label.text = ""
        label.isHidden = true
        return label
    }()
    

    
    var email: String? {
        return resetView.emailTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension ResetPasswordController{
    private func style(){
        
        view.backgroundColor = .systemBackground
        resetView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        forgotPasswordTitle.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordTitle.textAlignment = .center
        forgotPasswordTitle.font = UIFont.boldSystemFont(ofSize: 32)
        forgotPasswordTitle.text = "Forgot Password"
        
        forgotPasswordSbTitle.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordSbTitle.textAlignment = .center
        forgotPasswordSbTitle.font = UIFont.boldSystemFont(ofSize: 17)
        forgotPasswordSbTitle.textColor = .systemGray
        forgotPasswordSbTitle.numberOfLines = 0
        forgotPasswordSbTitle.text = "Enter your email for the verification process we will send 4 digits code to your email."
        
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.tintColor = appColor
        sendButton.configuration = .filled()
        sendButton.setTitle("CONTINUE", for: [])
        sendButton.configuration?.imagePadding = 8
        sendButton.addTarget(self, action: #selector(continueButtonPressed), for: .primaryActionTriggered)
        
        
    }
    
    private func layout(){
        
        stackView.addArrangedSubview(forgotPasswordTitle)
        
        stackView.addArrangedSubview(forgotPasswordSbTitle)
        stackView.addArrangedSubview(resetView)
        stackView.addArrangedSubview(sendButton)
        stackView.addArrangedSubview(errorLabel)
        
        view.addSubview(forgotImage)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            forgotImage.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 1),
            forgotImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            forgotImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            forgotImage.heightAnchor.constraint(equalToConstant: 240),
            
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: forgotImage.bottomAnchor, multiplier: 2),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 4)
        ])
    }
}

extension ResetPasswordController{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func continueButtonPressed(_ sender: UIButton){
        sendEmail()
    }
    
    func sendEmail(){
        errorReset()
        emailVerification()
    }
    
    func emailVerification(){
        guard let email = email else { return }
        
        if email.isEmpty{
            emailError("E-mail cannot be blank")
            return
        }
        
        if !email.isValidEmail{
            emailError("E-mail format incorrect ")
            return
        }
        
        let auth = Auth.auth()
        
        auth.sendPasswordReset(withEmail: email) { (error) in
            if let error = error{
                let alert = Service.createAlertController(title: "Error", message: error.localizedDescription)
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            let alert = Service.createAlertController(title: "Opoy", message: "A password reset email has been sent")
            self.present(alert, animated: true, completion: nil)
        }
        
        navigationController?.pushViewController(ValidationViewController(), animated: true)
    }
    
    public func errorReset(){
        resetView.layer.borderWidth = 0
        errorLabel.isHidden = true
    }
    
    public func emailError(_ errorMessage: String ){
        errorMessageConfig(text: errorMessage)
        resetView.layer.borderWidth = 1
    }

    
    public func errorMessageConfig(text: String){
        errorLabel.isHidden = false
        errorLabel.text = text
        
    }
}

// MARK: Validation Code

class ValidationViewController: UIViewController{
    
    let stackView = UIStackView()
    let enterCodeTitle =  UILabel()
    let enterCodeSubtitle = UILabel()
    let resetView = ResetPasswordView(placeholder: "Code", isSecurityCode: false, onlyKeyboard: true)
    let sendButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension ValidationViewController{
    private func style(){
        navigationItem.hidesBackButton = true
        view.backgroundColor = .systemBackground
        resetView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.axis = .vertical
        
        enterCodeTitle.translatesAutoresizingMaskIntoConstraints = false
        enterCodeTitle.textAlignment = .center
        enterCodeTitle.font = UIFont.boldSystemFont(ofSize: 32)
        enterCodeTitle.text = "Enter the code"
        
        enterCodeSubtitle.translatesAutoresizingMaskIntoConstraints = false
        enterCodeSubtitle.textAlignment = .center
        enterCodeSubtitle.font = UIFont.boldSystemFont(ofSize: 17)
        enterCodeSubtitle.textColor = .systemGray
        enterCodeSubtitle.numberOfLines = 0
        enterCodeSubtitle.text = "Enter the 4 digits code that you received on your email"
        
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.tintColor = appColor
        sendButton.configuration = .filled()
        sendButton.setTitle("CONTINUE", for: [])
        sendButton.configuration?.imagePadding = 8
        sendButton.addTarget(self, action: #selector(continueButtonPressed), for: .primaryActionTriggered)
        
    }
    
    private func layout(){
        stackView.addArrangedSubview(enterCodeTitle)
        stackView.addArrangedSubview(enterCodeSubtitle)
        stackView.addArrangedSubview(resetView)
        stackView.addArrangedSubview(sendButton)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 4)
        ])
    }
}

extension ValidationViewController{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func continueButtonPressed(_ sender: UIButton){
        navigationController?.pushViewController(NewPasswordViewController(), animated: true)
    }
}

// MARK: New Password

class NewPasswordViewController: UIViewController{
    
    
    let stackView = UIStackView()
    let resetPasswordTitle =  UILabel()
    let resetPasswordSubtitle = UILabel()
    let newPasswordTextField = ResetPasswordView(placeholder: "New Password", isSecurityCode: true, onlyKeyboard: false)
    let newPasswordTextFieldConfirmation = ResetPasswordView(placeholder: "Confirm new password", isSecurityCode: true, onlyKeyboard: false)
    let sendButton = UIButton(type: .system)
    
    var passwordRuleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.numberOfLines = 0
        label.text = """
        * Use at least 8 characters
        * Use upper and lower case characters
        * Use 1 or more numbers
        * Use special characters
        """

        return label
    }()
    
    var password: String? {
        return newPasswordTextField.emailTextField.text
    }
    
    var newPassword: String? {
        return newPasswordTextFieldConfirmation.emailTextField.text
    }
    
    public var errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .systemRed
        label.text = ""
        label.isHidden = true
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension NewPasswordViewController{
    private func style(){
        navigationItem.hidesBackButton = true
        view.backgroundColor = .systemBackground
        newPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.axis = .vertical
        
        resetPasswordTitle.translatesAutoresizingMaskIntoConstraints = false
        resetPasswordTitle.textAlignment = .center
        resetPasswordTitle.font = UIFont.boldSystemFont(ofSize: 32)
        resetPasswordTitle.text = "Reset Password"
        
        resetPasswordSubtitle.translatesAutoresizingMaskIntoConstraints = false
        resetPasswordSubtitle.textAlignment = .center
        resetPasswordSubtitle.font = UIFont.boldSystemFont(ofSize: 17)
        resetPasswordSubtitle.textColor = .systemGray
        resetPasswordSubtitle.numberOfLines = 0
        resetPasswordSubtitle.text = "Set the new password for your account so you can login and access all the features."
        
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.tintColor = appColor
        sendButton.configuration = .filled()
        sendButton.setTitle("CONTINUE", for: [])
        sendButton.configuration?.imagePadding = 8
        sendButton.addTarget(self, action: #selector(continueButtonPressed), for: .primaryActionTriggered)
        
    }
    
    private func layout(){
        stackView.addArrangedSubview(resetPasswordTitle)
        stackView.addArrangedSubview(resetPasswordSubtitle)
        stackView.addArrangedSubview(newPasswordTextField)
        
        stackView.addArrangedSubview(newPasswordTextFieldConfirmation)
        stackView.addArrangedSubview(passwordRuleLabel)
        stackView.addArrangedSubview(errorLabel)
        stackView.addArrangedSubview(sendButton)
        
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 4)
        ])
    }
}

extension NewPasswordViewController{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func continueButtonPressed(_ sender: UIButton){
        resetPassword()
    }
    
    func resetPassword(){
        errorReset()
        passwordsVerification()
    }
    
    func passwordsVerification(){
        guard let password = password, let newPassword = newPassword else { return }
    
        
        
        if password.isEmpty  && newPassword.isEmpty{
            passwordAndConfirmationdifferent("New Password / New password confirmation cannot be blank")
            return
        }
        
        if password.isEmpty{
            newPasswordError("New Password cannot be blank")
            return
        }
        
        if newPassword.isEmpty{
            newPasswordErrorConfimation("New password confirmation cannot be blank")
            return
        }
        
        if password != newPassword{
            passwordAndConfirmationdifferent("Password are differents")
            return
        }
        

        
        if !password.isValidPassoword{
            passwordRuleLabel.textColor = .systemRed
            return
        }
        
        navigationController?.dismiss(animated: true)
    }
    
    
    private func errorReset(){
        newPasswordTextField.layer.borderWidth = 0
        passwordRuleLabel.textColor = .systemGray
        newPasswordTextFieldConfirmation.layer.borderWidth = 0
        errorLabel.isHidden = true
    }
    
    private func passwordAndConfirmationdifferent(_ errorMessage: String){
        errorMessageConfig(text: errorMessage)
        newPasswordTextField.layer.borderWidth = 1
        newPasswordTextFieldConfirmation.layer.borderWidth = 1
    }
    
    private func newPasswordError(_ errorMessage: String ){
        errorMessageConfig(text: errorMessage)
        newPasswordTextField.layer.borderWidth = 1
    }
    
    private func newPasswordErrorConfimation(_ errorMessage: String ){
        errorMessageConfig(text: errorMessage)
        newPasswordTextFieldConfirmation.layer.borderWidth = 1
    }

    
    private func errorMessageConfig(text: String){
        errorLabel.isHidden = false
        errorLabel.text = text
        
    }
}
