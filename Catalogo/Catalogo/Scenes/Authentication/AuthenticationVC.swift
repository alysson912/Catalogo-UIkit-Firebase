//
//  AuthenticationVC.swift
//  Catalogo
//
//  Created by Alysson Menezes on 04/09/24.
//

import UIKit

protocol AuthenticationVCProtocol: AnyObject {
    func authenticate()
}

class AuthenticationVC: UIViewController, AuthenticationVCProtocol {
    func authenticate() {
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
    func actionSignInWithEmailButton() {
        let vc = SignInEmailVC()
        navigationController?.pushViewController(vc, animated: true)
       
    }
}

