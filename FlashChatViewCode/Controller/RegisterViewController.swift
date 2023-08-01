//
//  RegisterViewController.swift
//  FlashChatViewCode
//
//  Created by Matheus Sousa on 19/07/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var screen: RegisterScreen?
    var authFirebase = AuthFirebaseBrain()
    
    override func loadView() {
        super.loadView()
        self.screen = RegisterScreen()
        self.view = screen
        self.screen?.delegate(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func showAlert(title: String, message: String?) {
        let alert = Alert(title: title, message: message, viewController: self)
        
        alert.show()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension RegisterViewController: RegisterScreenDelegate {
    func tappedEyeShowPassword() {
        let isSecurity = self.screen?.passwordTextField.isSecureTextEntry ?? true
        let iconName = isSecurity ? "eye.slash.fill" : "eye.fill"
        
        let iconConfiguration = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium, scale: .default)
        let iconImage = UIImage(systemName: iconName, withConfiguration: iconConfiguration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        self.screen?.passwordTextField.isSecureTextEntry = !isSecurity
        self.screen?.passwordEyeButton.setImage(iconImage, for: .normal)
    }
    
    func tappedEyeShowConfirmPassword() {
        let isSecurity = self.screen?.confirmPasswordTextField.isSecureTextEntry ?? true
        let iconName = isSecurity ? "eye.slash.fill" : "eye.fill"
        
        let iconConfiguration = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium, scale: .default)
        let iconImage = UIImage(systemName: iconName, withConfiguration: iconConfiguration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        self.screen?.confirmPasswordTextField.isSecureTextEntry = !isSecurity
        self.screen?.confirmPasswordEyeButton.setImage(iconImage, for: .normal)
    }
    
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func tappedRegisterButton() {
        let email = screen?.emailTextField.text ?? ""
        let password = screen?.passwordTextField.text ?? ""
        let confirmPassword = screen?.confirmPasswordTextField.text ?? ""
        
        if email != "", password != "",confirmPassword != "" {
            if password == confirmPassword {
                authFirebase.registerWithEmailAndPassword(email: email.lowercased(), password: password) { authResult in
                    if authResult.error {
                        self.showAlert(title: "Registration Error!", message: authResult.errorMessage)
                    } else {
                        UserSingleton.shared.user = authResult.user
                        self.navigationController?.pushViewController(ChatViewController(), animated: true)
                    }
                }
                
            } else {
                showAlert(title: "Verify Passwords", message: "Passwords are not the same")
            }
        }else {
            showAlert(title: "Check The Fields", message: "Please complete all fields before submitting.")
        }
        
        
    }
    
    func tappedGoToLogin() {
        if let navigationController = self.navigationController {
            for viewController in navigationController.viewControllers {
                if viewController is LoginViewController {
                    navigationController.popToViewController(viewController, animated: true)
                    return
                }
            }
            navigationController.pushViewController(LoginViewController(), animated: true)
        }
    }
}
