//
//  AuthenticationViewModel.swift
//  Catalogo
//
//  Created by ALYSSON MENEZES on 13/01/25.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth


struct GoogleSignInResultModel {
    let idToken: String
    let accessToken: String
}

@MainActor
final class AuthenticationViewModel {
    
     let authenticationManager = AuthenticationManager()
    
    func signInGoogle() async throws {
        guard let topVC = Utilities.shared.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        
        guard let idToken = gidSignInResult.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)
        }
        
        let accessToken = gidSignInResult.user.accessToken.tokenString
        
       let tokens = GoogleSignInResultModel(idToken: idToken, accessToken: accessToken)
        try await authenticationManager.signInWithGoogle(tokens: tokens)
    }
}
