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
    private var password: String?
    
    //passando dados recebidos e armazenados nas variaveis para a funcao sigIn()
    func didReceiveFormData(email: String, password: String)  {
        self.email = email
        self.password = password
        
     
            do {
                signUp(email: email, password: password)
                print("Login success")
                return
            } catch {
                print(error)
            }
        }
    
    
    func signIn(email: String, password: String) {
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
    
    func signUp(email: String, password: String) {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }
        
        Task {
            do {
                let returnedUserData = try await authenticationManager.signInUser(with: email, password: password)
                print("success")
                print(returnedUserData)
            } catch {
                print("ERROR: \(error)")
            }
        }
    }
}


