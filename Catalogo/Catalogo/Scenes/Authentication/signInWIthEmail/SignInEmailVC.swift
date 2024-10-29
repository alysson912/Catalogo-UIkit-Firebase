//
//  SignInEmailVC.swift
//  Catalogo
//
//  Created by Alysson Menezes on 04/09/24.
//

import UIKit
import FirebaseAuth

class SignInEmailVC: UIViewController {
    
    private var viewModel = SignInEmailViewModel()
    private var authenticationManager = AuthenticationManager()
    
    private var screen: SignInEmailView?
    private var auth: Auth?
    private var alert: Alert?
    
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
        viewModel.delegade(delegate: self)
        hideKeyboardWhenTappedAround()
        auth = Auth.auth()
    }
    
}

extension SignInEmailVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //  self.screen?.validateTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension SignInEmailVC: SignInEmailViewProtocol {
    func actionSignInButton()  {
        //        guard let login = screen else { return }
        //
        //        auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { usuario, error in
        //            if error != nil {
        //                self.alert?.getAlert(titulo: "Atenção", mensagem: "Dados Incorretos,verifique e tente Novamente!!")
        //            } else {
        //                if usuario == nil {
        //                    self.alert?.getAlert(titulo: "Atenção", mensagem: "Tivemos um problema inesperado, tente novamente mais tarde")
        //                } else {
        //                    viewModel.sigIn()
        //                  //  let VC = MainTabBarController()
        //                 //   let navVC = UINavigationController(rootViewController: VC)
        //                 //   navVC.modalPresentationStyle = .fullScreen
        //                 //   self.present(navVC, animated: true, completion: nil)
        //                }
        //            }
        //
        //        })
        // buscando os dados processados na viewModel
        didTapLogin()
            }
    
    func actionRegisterButton() {
        func actionRegisterButton() {
        
        }
    }
    
    
}
// recebendo os dados da view, e levando para viewModel
extension SignInEmailVC: SignInEmailViewModelProtocol {
    func didTapLogin() {
        let email = screen?.getEmail() ?? ""
        let password = screen?.getPassword() ?? ""
        
        viewModel.sigIn(email: email, password: password)
    }
}



