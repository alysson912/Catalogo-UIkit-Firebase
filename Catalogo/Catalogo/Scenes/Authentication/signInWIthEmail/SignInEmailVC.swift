//
//  SignInEmailVC.swift
//  Catalogo
//
//  Created by Alysson Menezes on 04/09/24.
//

import UIKit
import FirebaseAuth

class SignInEmailVC: UIViewController {
    private var screen: SignInEmailView?
    private var auth: Auth?
    private var alert: Alert?
    private var viewModel = SignInEmaiViewModel()
    
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
        guard let login = screen else { return }
              
              auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { usuario, error in
                  if error != nil {
                      self.alert?.getAlert(titulo: "Atenção", mensagem: "Dados Incorretos,verifique e tente Novamente!!")
                  } else {
                      if usuario == nil {
                          self.alert?.getAlert(titulo: "Atenção", mensagem: "Tivemos um problema inesperado, tente novamente mais tarde")
                      } else {
                          let VC = MainTabBarController()
                          let navVC = UINavigationController(rootViewController: VC)
                          navVC.modalPresentationStyle = .fullScreen
                          self.present(navVC, animated: true, completion: nil)
                      }
                  }
                  
              })
    }
    
    func actionRegisterButton() {
        func actionRegisterButton() {
              //  let vc: RegisterVC = RegisterVC()
               // self.navigationController?.pushViewController(vc, animated: true)
            }
    }
    
    
}
