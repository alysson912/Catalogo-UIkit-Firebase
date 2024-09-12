//
//  SignInEmailViewModel.swift
//  Catalogo
//
//  Created by Alysson Menezes on 04/09/24.
//

import Foundation

final class SignInEmaiViewModel {
    
    var email = ""
    var password = ""
    
    func sigIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }
            do {
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                print("Success")
                print(returnedUserData)
            } catch {
                print("Error: \(error)")
            }
        }
    }

