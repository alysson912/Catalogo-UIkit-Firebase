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
    weak var authCompletionDelegate: AuthenticationCompletionDelegate?
    
    
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
    
    public func validateTextFields(){
        let email: String = screen?.getEmail() ?? ""
        let password: String = screen?.getPassword() ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            screen?.signInButton.isEnabled = true
            screen?.signInButton.titleLabel?.textColor = .white
        }else{
            screen?.signInButton.isEnabled = false
            screen?.signInButton.titleLabel?.textColor = .darkGray
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        auth = Auth.auth()
        screen?.delegate(delegate: self)
        screen?.configTextFieldDelegate(delegate: self)
        hideKeyboardWhenTappedAround()
        
    }
    
}

extension SignInEmailVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        validateTextFields()
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
        validateTextFields()
        
        let mainTabBarController = MainTabBarController()
        mainTabBarController.modalPresentationStyle = .fullScreen
        present(mainTabBarController, animated: true, completion: nil)
    }
    
    func actionRegisterButton() {
        func actionRegisterButton() {
            
        }
    }
    
    
}
