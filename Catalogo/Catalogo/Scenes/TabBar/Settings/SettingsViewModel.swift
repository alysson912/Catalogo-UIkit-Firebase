//
//  SettingsViewModel.swift
//  Catalogo
//
//  Created by ALYSSON MENEZES on 14/01/25.
//

import Foundation
import UIKit

struct SetupEmailSection {
    let leadingIconOption: String
    let titleLabel: String
    let trailingIconOption: String
}

@MainActor
final class SettingsViewModel {
    
    private var authenticationManager = AuthenticationManager()
     var options: [SetupEmailSection] = [
    
    SetupEmailSection(leadingIconOption: "person.circle", titleLabel: "reset password", trailingIconOption: "arrow.forward"),
    SetupEmailSection(leadingIconOption: "person.circle", titleLabel: "update password", trailingIconOption: "arrow.forward"),
    SetupEmailSection(leadingIconOption: "person.circle", titleLabel: "update email ", trailingIconOption: "arrow.forward")
   
   
    ]
    
    var authProviders: [AuthProviderOption] = []
    var authUser: AuthDataResultModel? = nil
    
    
    func loadAuthProviders() {
        if let providers = try? authenticationManager.getProviders() {
            authProviders = providers
        }
    }
    
    func loadAuthUser() {
        self.authUser = try? authenticationManager.getAuthenticateUser()
    }
    
    func signOut() throws {
        try authenticationManager.signOut()
    }
    
    func resetPassword() async throws {
        let authUser = try authenticationManager.getAuthenticateUser()
        
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist)
        }
        
        try await authenticationManager.resetPassword(email: email)
    }
    
    func updateEmail() async throws {
        // fake email
        let fakeEmail: String = "almnz@gmail.com"
        try await authenticationManager.updateEmail(email: fakeEmail)
    }
    
    func updatePassword() async throws {
        let fakePassword: String = "Hello123456789"
        try await authenticationManager.updatePassword(password: fakePassword)
    }
}

//TableView
extension SettingsViewModel {
        
    public var heightForRowAt: CGFloat {
        return 65
    }
    
    public var numberOfRowsInSection: Int {
        return options.count
    }
    
    public func  loadCurrentLastesDeal(indexPath: IndexPath) -> SetupEmailSection {
        return options[indexPath.row]
    }
    
    public func swithOptions(indexPath: IndexPath) async  {
            
            let option = indexPath.row
            
            switch option {
                
            case 0:
                
                do {
                    try await updatePassword()
                    print("Password Updated !")
                } catch {
                    print("Failed to update password: \(error)")
                }
                
            case 1:
                
                do {
                    try await updateEmail()
                    print("Email Updated !")
                } catch {
                    print("Failed to update email: \(error)")
                }
                
            case 2:
                
                do {
                    try await resetPassword()
                     print("resetPassword !")
                } catch {
                    print("Failed to reset password: \(error)")
                }
                
            case 3:
                
                do {
                   // try await resetPassword()
                     print("Link Google Account!")
                } catch {
                    print("Failed to reset password: \(error)")
                }
                
            case 4:
                
                do {
               //     try await resetPassword()
                 print("Link E-mail account")
                } catch {
                    print("Failed to reset password: \(error)")
                }


                
            default:
                print("O número é maior que 8")
            }
            
        }
}
