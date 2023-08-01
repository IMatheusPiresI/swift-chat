//
//  ChatViewController.swift
//  FlashChatViewCode
//
//  Created by Matheus Sousa on 21/07/23.
//

import UIKit

class ChatViewController: UIViewController {
    
    var screen: ChatScreen?
    let authFirebase = AuthFirebaseBrain()
    let dbFirebase = FirebaseDB.shared
    
    
    override func loadView() {
        super.loadView()
        self.screen = ChatScreen()
        self.view = screen
        self.screen?.delegate(delegate: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadMessages()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func loadMessages() {
        DispatchQueue.main.async {
            FirebaseDB.shared.getAllMessages { messages in
                if let allMessages = messages {
                    self.screen?.messages = allMessages
                    self.screen?.messagesTableView.reloadData()
                    if allMessages.count > 0 {
                        let indexPath = IndexPath(row: allMessages.count - 1, section: 0)
                        self.screen?.messagesTableView.scrollToRow(at: indexPath, at: .top, animated: true)
                    }
                    
                    return
                }
                print("error get all messages")
            }
        }
        
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

extension ChatViewController: ChatScreenDelegate {
    func tappedLogoutButton() {
        authFirebase.signOut()
        navigationController?.popToRootViewController(animated: true)
    }
    
    func tappedSendMessageButton(){
        let userEmail = UserSingleton.shared.user?.email
        let messageBody = screen?.messageTextField.text
        
        if let email = userEmail, let message = messageBody {
            let date = Date()
            let model = MessageModel(message: message, sender: email, createdAt: date.timeIntervalSince1970)
            
            dbFirebase.sendMessage(message: model)
            self.screen?.messageTextField.text = ""
        }
    }
}
