//
//  LoginViewController.swift
//  iChat
//
//  Created by Alexander Petrenko on 09.09.2021.
//

import UIKit
import Foundation

class LoginViewController: UIViewController {
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "iChat"
        label.font = label.font.withSize(30)
        label.textAlignment = .center
        return label
    }()
    
    let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textAlignment = .center
        return label
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textAlignment = .center
        return label
    }()
    
    let loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "LOGIN"
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "PASSWORD"
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.addTarget(
            self,
            action: #selector(loginButtonPressed),
            for: UIControl.Event.touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        view.backgroundColor = .systemGreen
        setupLoginContentView()
        
    }
    
    func setupLoginContentView() {
        self.view.addSubview(mainLabel)
        self.view.addSubview(loginLabel)
        self.view.addSubview(passwordLabel)
        self.view.addSubview(loginTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(loginButton)
        setupMainLabel()
        setupLoginLabel()
        setupLoginTextField()
        setupPasswordLabel()
        setupPasswordTextField()
        setupLoginButton()
    }
    
    func setupMainLabel(){
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.topAnchor.constraint(
            equalTo: self.view.topAnchor,
            constant: 40).isActive = true
        mainLabel.centerXAnchor.constraint(
            equalTo: self.view.centerXAnchor).isActive = true
        mainLabel.widthAnchor.constraint(
            equalToConstant: 300).isActive = true
        mainLabel.heightAnchor.constraint(
            equalToConstant: 40).isActive = true
    }
    
    func setupLoginLabel(){
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.topAnchor.constraint(
            equalTo: mainLabel.bottomAnchor,
            constant: 40).isActive = true
        loginLabel.centerXAnchor.constraint(
            equalTo: self.view.centerXAnchor).isActive = true
        loginLabel.widthAnchor.constraint(
            equalToConstant: 300).isActive = true
        loginLabel.heightAnchor.constraint(
            equalToConstant: 40).isActive = true
    }
    
    func setupPasswordLabel() {
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.topAnchor.constraint(
            equalTo: loginTextField.bottomAnchor,
            constant: 40).isActive = true
        passwordLabel.centerXAnchor.constraint(
            equalTo: self.view.centerXAnchor).isActive = true
        passwordLabel.widthAnchor.constraint(
            equalToConstant: 300).isActive = true
        passwordLabel.heightAnchor.constraint(
            equalToConstant: 40).isActive = true
    }
    
    func setupLoginTextField() {
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.isUserInteractionEnabled = true
        loginTextField.backgroundColor = .white
        loginTextField.frame.size.width = 200
        loginTextField.frame.size.height = 20
        loginTextField.topAnchor.constraint(
            equalTo: loginLabel.bottomAnchor,
            constant: 10).isActive = true
        loginTextField.centerXAnchor.constraint(
            equalTo: self.view.centerXAnchor).isActive = true
        loginTextField.widthAnchor.constraint(
            equalToConstant: 300).isActive = true
        loginTextField.heightAnchor.constraint(
            equalToConstant: 40).isActive = true
    }
    
    
    func setupPasswordTextField() {
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.isUserInteractionEnabled = true
        passwordTextField.backgroundColor = .white
        passwordTextField.frame.size.width = 200
        passwordTextField.frame.size.height = 20
        passwordTextField.topAnchor.constraint(
            equalTo: passwordLabel.bottomAnchor,
            constant: 10).isActive = true
        passwordTextField.centerXAnchor.constraint(
            equalTo: self.view.centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(
            equalToConstant: 300).isActive = true
        passwordTextField.heightAnchor.constraint(
            equalToConstant: 40).isActive = true
    }
    func setupLoginButton() {
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.isUserInteractionEnabled = true
        loginButton.backgroundColor = .white
        loginButton.frame.size.width = 100
        loginButton.frame.size.height = 30
        loginButton.topAnchor.constraint(
            equalTo: passwordTextField.bottomAnchor,
            constant: 40).isActive = true
        loginButton.centerXAnchor.constraint(
            equalTo: self.view.centerXAnchor).isActive = true
        loginButton.widthAnchor.constraint(
            equalToConstant: 100).isActive = true
        loginButton.heightAnchor.constraint(
            equalToConstant: 30).isActive = true
    }
    
    
    
    
    
    
    
    
    
    
    
    private func checkPassword() {
        let login = self.loginTextField.text
        let password = self.passwordTextField.text
        
        if login == "admin" && password == "admin" {
            self.showAdminScene()
        } else if login == "" || password == "" {
            self.showAlert()
        } else {
        self.showMainScreen()
        }
    }

    private func showMainScreen() {
        let viewController = Constants.Storyboard.mainScreen.instantiateInitialViewController()

        if let viewController = viewController as? TabViewController {
            //self.present(viewController, animated: true)
            self.show(viewController, sender: nil)
            
        }
    }
    
    private func showAdminScene() {
        let viewController = Constants.Storyboard.debugMenu.instantiateInitialViewController()

        if let viewController = viewController as? DebugViewController {
            self.present(viewController, animated: true)
        }
    }

    private func showAlert() {
        let alertController = UIAlertController(
            title: "Incorrect",
            message: "Input login and password",
            preferredStyle: .actionSheet)

        // добавляем кнопки
        let action = UIAlertAction(
            title: "Re-send!",
            style: .destructive)

        alertController.addAction(action)
        self.present(alertController, animated: true)
        
     
    }
    
    @objc func loginButtonPressed(sender: UIButton) {
    
        self.checkPassword()
        
    }
    
}
