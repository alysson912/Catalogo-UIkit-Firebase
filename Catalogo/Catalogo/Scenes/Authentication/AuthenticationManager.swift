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
    
    @discardableResult // vem um valor de retorno dessa func mas nao me importo, descarte ele
    func createUser(with email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await  Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    // verificando se o usuario esta logado localmente
    func getAuthenticateUser() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return  AuthDataResultModel(user: user)
    }
    
    @discardableResult 
    func signInUser(with email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await  Auth.auth().signIn(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    func signOut() throws {
       try Auth.auth().signOut()
    }
    
}

