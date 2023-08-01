//
//  MessageModel.swift
//  FlashChatViewCode
//
//  Created by Matheus Sousa on 23/07/23.
//

import Foundation

struct MessageModel {
    let message: String
    let sender: String
    let createdAt: Double
    
    init(message: String, sender: String, createdAt: Double) {
        self.message = message
        self.sender = sender
        self.createdAt = createdAt
    }
}
