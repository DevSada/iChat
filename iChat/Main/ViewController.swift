//
//  ViewController.swift
//  iChat
//
//  Created by Alexander Petrenko on 07.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    
    private var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGesture()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeObservers()
    }
    
    private func addGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleGesture))
        self.scrollView.addGestureRecognizer(gesture)
    }
    
    @objc private func handleGesture(){
        self.scrollView.endEditing(true)
    }
    
    private func addObservers(){
        NotificationCenter.default
            .addObserver(
                self,
                selector: #selector(handleKeyboardWillShow),
                name: UIResponder.keyboardWillShowNotification,
                object: nil)
        
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(handleKeyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeObservers()  {
        NotificationCenter.default
            .removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default
            .removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func handleKeyboardWillShow(){
        self.scrollView.contentInset.bottom += 200
    }
    
    @objc private func handleKeyboardWillHide(){
        self.scrollView.contentInset.bottom = 0
    }
    
    private func checkPassword() {
        let login = self.loginTextField.text
        let password = self.passwordTextField.text
        
        if login == "ad" && password == "ad" {
            self.showAdminScene()
        } else {
            self.showAlert()
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
            message: "Incorrect login or password",
            preferredStyle: .actionSheet)
        
        // добавляем кнопки
        let action = UIAlertAction(
            title: "Re-send!",
            style: .destructive)
        
        alertController.addAction(action)
        self.present(alertController, animated: true)
        
     
    }
    
    @IBAction private func onButtonPressed(_ sender: Any) {
        
        self.checkPassword()
        
    }
    

}

