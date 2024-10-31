//
//  SignInEmailViewModel.swift
//  Catalogo
//
//  Created by Alysson Menezes on 10/10/24.
//

import Foundation
import FirebaseAuth

class SignInEmailViewModel: SignInEmailVCProtocol{
    
    private var authenticationManager = AuthenticationManager()
    
    // armazenando dados recebidos pelo protocolo
    private var email: String?
    private var senha: String?
    
    //passando dados recebidos e armazenados nas variaveis para a funcao sigIn()
    func didReceiveFormData(email: String, senha: String) {
        self.email = email
        self.senha = senha
        sigIn(email: email, password: senha)
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


