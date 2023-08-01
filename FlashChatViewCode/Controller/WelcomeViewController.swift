//
//  WelcomeViewController.swift
//  FlashChatViewCode
//
//  Created by Matheus Sousa on 19/07/23.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var screen: WelcomeScreen?
    
    override func loadView() {
        super.loadView()
        self.screen = WelcomeScreen()
        self.view = screen
        self.view.backgroundColor = .white
        self.screen?.delegate(delegate: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
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

extension WelcomeViewController: WelcomeScreenDelegate {
    func tappedLoginButton() {
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
    func tappedRegisterButton() {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
}
