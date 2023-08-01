//
//  UserSingleton.swift
//  FlashChatViewCode
//
//  Created by Matheus Sousa on 21/07/23.
//

import Foundation

class UserSingleton {
    static let shared = UserSingleton()
    
    var user: UserModel?
    
    private init(){
        // Initial config singleton
    }
}
