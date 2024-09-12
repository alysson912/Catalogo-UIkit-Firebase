//
//  AuthenticationVC.swift
//  Catalogo
//
//  Created by Alysson Menezes on 04/09/24.
//

import UIKit

class AuthenticationVC: UIViewController {
    var screen = AuthenticationView()
    
    override func loadView() {
         screen = AuthenticationView()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen.delegate(delegate: self)
        
    }
    
}

extension AuthenticationVC: AuthenticationViewProtocol {
    func actionSignInWithEmailButton() {
        print("teste")
        let vc = SignInEmailVC()
        navigationController?.pushViewController(vc, animated: true)
       
    }
}

