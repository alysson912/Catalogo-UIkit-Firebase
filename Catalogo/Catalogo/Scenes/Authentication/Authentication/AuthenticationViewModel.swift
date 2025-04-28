//
//  AuthenticationViewModel.swift
//  Catalogo
//
//  Created by ALYSSON MENEZES on 13/01/25.
//

import Foundation

@MainActor
final class AuthenticationViewModel {
    
    let authenticationManager = AuthenticationManager()
    
    func signInGoogle() async throws {
        let helper = SignInWithGoogleHelper()
        let tokens = try await helper.signIn()
        try await authenticationManager.signInWithGoogle(tokens: tokens)
    }
    
    func signInAnonymous() async throws {
  
        try await authenticationManager.signInAnonnymous()
    }
}
