//
//  FirebaseDB.swift
//  FlashChatViewCode
//
//  Created by Matheus Sousa on 23/07/23.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class FirebaseDB {
    static let shared = FirebaseDB()
    
    private let db = Firestore.firestore()
    private let messageCollection: CollectionReference
    
    init() {
        messageCollection = db.collection("messages")
    }
    
    public func sendMessage(message: MessageModel) {
        var ref: DocumentReference? = nil
        
        ref = messageCollection.addDocument(data: [
            "sender": message.sender,
            "message": message.message,
            "createdAt": message.createdAt
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                if let docId = ref?.documentID {
                    print("Document added with ID: \(docId)")
                }
            }
        }
    }
    
    public func getAllMessages( completion: @escaping ([MessageModel]?) -> Void) {
        messageCollection.order(by: "createdAt").addSnapshotListener { (querySnapshot, err) in
            if let e = err {
                print(e)
                completion(nil)
            } else {
                var messageModels: [MessageModel] = []
                for document in querySnapshot!.documents {
                    let data = document.data()
                    
                    let messageBody = data["message"] as! String
                    let email = data["sender"] as! String
                    let createdAt = data["createdAt"] as! Double
                    let message = MessageModel(message: messageBody, sender: email, createdAt: createdAt)
                    
                    messageModels.append(message)
                }
                completion(messageModels)
            }
        }
    }
}
