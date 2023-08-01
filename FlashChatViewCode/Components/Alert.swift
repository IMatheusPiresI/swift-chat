//
//  ViewController.swift
//  FlashChatViewCode
//
//  Created by Matheus Sousa on 21/07/23.
//

import UIKit

class Alert: UIViewController {
    
    let titleAlert: String
    let message: String?
    let viewController: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(title: String, message: String? = nil, viewController: UIViewController) {
        self.titleAlert = title
        self.message = message
        self.viewController = viewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show() {
        let alert = UIAlertController(title: titleAlert, message: message ?? "", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action1)
        
        self.viewController.present(alert, animated: true)
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
