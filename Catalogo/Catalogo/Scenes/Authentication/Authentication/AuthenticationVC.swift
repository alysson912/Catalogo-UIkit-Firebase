//
//  AuthenticationVC.swift
//  Catalogo
//
//  Created by Alysson Menezes on 04/09/24.
//

import UIKit


protocol AuthenticationVCProtocol: AnyObject {
    func authentication()
}

class AuthenticationVC: UIViewController, AuthenticationVCProtocol {
    
    private var viewModel = AuthenticationViewModel()
    
    
    func authentication() {
        print("Autenticando no AuthenticationVC")
    }
    
    var screen = AuthenticationView()
    
    override func loadView() {
        screen = AuthenticationView()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen.delegate(delegate: self)
        
    }
    
    
}

extension AuthenticationVC: AuthenticationViewProtocol {
    func actionSignInWithAnonymously() {
        Task {
            do {
                try await viewModel.signInAnonymous()
                
                let vc = MainTabBarController()
                navigationController?.pushViewController(vc, animated: true)
                
//                let mainTabBarController = MainTabBarController()
//                mainTabBarController.modalPresentationStyle = .fullScreen
//                present(mainTabBarController, animated: true, completion: nil)
                
            } catch {
                print(error)
            }
            
        }
    }
    
    func actionSignInWithGoogle() {
        Task {
            do {
                try await viewModel.signInGoogle()
                
                let mainTabBarController = MainTabBarController()
                mainTabBarController.modalPresentationStyle = .fullScreen
                present(mainTabBarController, animated: true, completion: nil)
                
            } catch {
                print(error)
            }
        }
    }
    
    func actionSignInWithEmailButton() {
        let vc = SignInEmailVC()
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

