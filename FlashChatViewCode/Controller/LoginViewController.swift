//
//  LoginViewController.swift
//  FlashChatViewCode
//
//  Created by Matheus Sousa on 19/07/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    var screen: LoginScreen?
    var authFirebase = AuthFirebaseBrain()
    
    override func loadView() {
        super.loadView()
        self.screen = LoginScreen()
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

extension LoginViewController: LoginScreenDelegate {
    func tappedBackButton(){
        navigationController?.popViewController(animated: true)
    }
    
    func tappedLoginButton(){
        let email = screen?.emailTextField.text ?? ""
        let password = screen?.passwordTextField.text ?? ""
        
        if email != "", password != ""{
            authFirebase.signInWithEmailAndPassword(email: email, password: password) { authResult in
                if authResult.error {
                    self.showAlert(title: "Error!", message: authResult.errorMessage)
                }
                
                if let user = authResult.user {
                    UserSingleton.shared.user = user
                    self.navigationController?.pushViewController(ChatViewController(), animated: true)
                }
            }
        } else {
            showAlert(title: "Check The Fields", message: "Please complete all fields before submitting.")
        }
    }
    
    func tappedGoToRegister(){
        if let navigationController = self.navigationController {
            for viewController in navigationController.viewControllers {
                if viewController is RegisterViewController {
                    navigationController.popToViewController(viewController, animated: true)
                    return
                }
            }
            navigationController.pushViewController(RegisterViewController(), animated: true)
        }
    }
    
    func tappedEyeShowPassword(){
        let isSecurity = self.screen?.passwordTextField.isSecureTextEntry ?? true
        let iconName = isSecurity ? "eye.slash.fill" : "eye.fill"
        
        let iconConfiguration = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium, scale: .default)
        let iconImage = UIImage(systemName: iconName, withConfiguration: iconConfiguration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        self.screen?.passwordTextField.isSecureTextEntry = !isSecurity
        self.screen?.eyeButton.setImage(iconImage, for: .normal)
    }
}
