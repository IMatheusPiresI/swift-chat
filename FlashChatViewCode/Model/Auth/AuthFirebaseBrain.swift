//
//  AuthFirebaseBrain.swift
//  FlashChatViewCode
//
//  Created by Matheus Sousa on 21/07/23.
//

import Foundation
import FirebaseAuth

class AuthFirebaseBrain {
    private let auth = Auth.auth()
    
    func signInWithEmailAndPassword(email: String, password: String, completion: @escaping (AuthResult) -> Void) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            
            if let e = error {
                let errorResult = AuthResult(user: nil, error: true, errorMessage: e.localizedDescription)
                
                completion(errorResult)
            }
            
            if let user = authResult?.user {
                if let userEmail = user.email {
                    let userModel = UserModel(email: userEmail, id: user.uid)
                    
                    let userResult = AuthResult(user: userModel, error: false, errorMessage: nil)
                    
                    completion(userResult)
                }
            }
        }
    }
    
    func registerWithEmailAndPassword(email: String, password: String, completion:  @escaping (AuthResult) -> Void) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            if let e = error {
                let errorResult = AuthResult(user: nil, error: true, errorMessage: e.localizedDescription)
                
                completion(errorResult)
            }
            
            if let user = authResult?.user {
                if let userEmail = user.email {
                    let userFormat = UserModel(email: userEmail, id: user.uid)
                    
                    let userResult = AuthResult(user: userFormat, error: false, errorMessage: nil)
                    
                    completion(userResult)
                }
            }
        }
    }
    
    func signOut(){
        do{
            try auth.signOut()
        }
        catch {
            print(error.localizedDescription)
        }
    }
}
