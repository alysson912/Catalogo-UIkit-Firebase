//
//  AuthenticationManager.swift
//  Catalogo
//
//  Created by Alysson Menezes on 23/10/24.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let email: String?
    let photoURL: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoURL = user.photoURL?.absoluteString
    }
}

final class AuthenticationManager {
    
    func createUser(with email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await  Auth.auth().createUser(withEmail: email, password: password)
           return AuthDataResultModel(user: authDataResult.user)
        }
    }

