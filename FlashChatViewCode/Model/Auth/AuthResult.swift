//
//  AuthResult.swift
//  FlashChatViewCode
//
//  Created by Matheus Sousa on 21/07/23.
//

import Foundation

struct AuthResult {
    let error: Bool;
    let user: UserModel?;
    let errorMessage: String?;
    
    init(user: UserModel?, error: Bool, errorMessage: String?) {
        self.error = error
        self.user = user
        self.errorMessage = errorMessage
    }
}
