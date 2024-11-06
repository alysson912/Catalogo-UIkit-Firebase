//
//  SignInEmailVC.swift
//  Catalogo
//
//  Created by Alysson Menezes on 04/09/24.
//

import UIKit
import FirebaseAuth

protocol SignInEmailVCProtocol: AnyObject {
    func didReceiveFormData(email: String, password: String)
}

class SignInEmailVC: UIViewController {
    
    private var viewModel = SignInEmailViewModel()
    private var authenticationManager = AuthenticationManager()
    
    private var screen: SignInEmailView?
    private var auth: Auth?
    private var alert: Alert?
    
    private weak var delegade: SignInEmailVCProtocol?
    
    public func delegade(delegade: SignInEmailVCProtocol?) {
        self.delegade = delegade
    }
    
    override func loadView() {
        screen = SignInEmailView()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.configTextFieldDelegate(delegate: self)
        hideKeyboardWhenTappedAround()
        auth = Auth.auth()
    }
    
}

extension SignInEmailVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.screen?.validateTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension SignInEmailVC: SignInEmailViewProtocol {
    func actionSignInButton()  {
        // buscando os dados processados na viewModel
        viewModel.didReceiveFormData(email: screen?.getEmail() ?? "", password: screen?.getPassword() ?? "")
        let vc = SettingsVC()
        navigationController?.pushViewController(vc, animated: true)
       
    }
    
    func actionRegisterButton() {
        func actionRegisterButton() {
            
        }
    }
    
    
}
