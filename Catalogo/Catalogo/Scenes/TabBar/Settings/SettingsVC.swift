//
//  SettingsVC.swift
//  Catalogo
//
//  Created by Alysson Menezes on 04/11/24.
//

import UIKit

@MainActor
final class SeetingsViewModel {
    
    private var authenticationManager = AuthenticationManager()
        
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


class SettingsVC: UIViewController {
    private var screen: SettingsScreen?
    private var viewModel = SeetingsViewModel()
    
    override func loadView() {
        screen = SettingsScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
   override func viewDidLoad() {
        super.viewDidLoad()
       screen?.delegade(delegate: self)
    }

}

extension SettingsVC: SettingsScreenDelegade {
    func tappedUpdatePasswordButtonAction() async {
        do {
            try await viewModel.updatePassword()
            print("Password Updated !")
        } catch {
            print("Failed to update password: \(error)")
        }
    }
    
    func tappedUpdateEmailButtonAction() async {
        do {
            try await viewModel.updateEmail()
            print("Email Updated !")
        } catch {
            print("Failed to update email: \(error)")
        }
    }
    
    func tappedResetPasswordButtonAction() async {
        do {
            try await viewModel.resetPassword()
             print("Password Reset !")
        } catch {
            print("Failed to reset password: \(error)")
        }
    }

    func tappedLogOutActionButton() {
        try? viewModel.signOut()
        
        let vc = AuthenticationVC()
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true, completion: nil)
    }
        
    }
    
    

