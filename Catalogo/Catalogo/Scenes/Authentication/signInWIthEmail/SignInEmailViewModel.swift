//
//  SignInEmailViewModel.swift
//  Catalogo
//
//  Created by Alysson Menezes on 10/10/24.
//

import Foundation
import FirebaseAuth

protocol SignInEmailViewModelProtocol: AnyObject {
    func didTapLogin()
}

class SignInEmailViewModel {
    
    private var authenticationManager = AuthenticationManager()
    private weak var delegade: SignInEmailViewModelProtocol?
    
    public func delegade(delegate: SignInEmailViewModelProtocol?) {
        self.delegade = delegate
    }
     
    func sigIn(email: String, password: String) {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }
        
        Task {
            do {
                let returnedUserData = try await authenticationManager.createUser(with: email, password: password)
                print("success")
                print(returnedUserData)
            } catch {
                print("ERROR: \(error)")
            }
        }
    }
}


