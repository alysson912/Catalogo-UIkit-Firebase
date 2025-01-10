//
//  RegisterVCViewController.swift
//  LoginViewCode
//
//  Created by ALYSSON MENEZES on 17/05/22.
//

import UIKit


protocol SignUpWithEmailVCProtocol: AnyObject {
    func didReceiveFormData(email: String, password: String)
}

class SignUpWithEmailVC: UIViewController {
    
    private var screen: SignUpWithEmail?
    
    private var viewModel = SignUpEmailViewModel()
    private var authenticationManager = AuthenticationManager()
    private var alert: AlertController?
    
    
    private weak var delegade: SignUpWithEmailVCProtocol?
    
    public func delegade(delegade: SignUpWithEmailVCProtocol?) {
        self.delegade = delegade
    }
    
    override func loadView() {
        self.screen = SignUpWithEmail()
        alert = AlertController(controller: self)
        self.view = self.screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configButtonEnable(false)
        screen?.configTextFieldDelegate(delegate: self)
        screen?.delegate(delegate: self)
        hideKeyboardWhenTappedAround()
    }
    
    public func validarTextFields(){
        let email: String = screen?.getEmail() ?? ""
        let password: String = screen?.getPassword() ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            self.configButtonEnable(true)
        }else{
            self.configButtonEnable(false)
        }
    }
    
    private func configButtonEnable(_ enable : Bool ){
        if enable{
            self.screen?.registerButton.setTitleColor(.white, for: .normal)
            self.screen?.registerButton.isEnabled = true
        }else {
            self.screen?.registerButton.setTitleColor(.lightGray, for: .normal)
            self.screen?.registerButton.isEnabled = false
        }
    }
    
}
extension SignUpWithEmailVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
      validarTextFields()
    }
    
    func textFieldShouldReturn(_ texField: UITextField) -> Bool {
        texField.resignFirstResponder()
        return true
    }
}

extension SignUpWithEmailVC: RegisterScreenProtocol {
    
    func actionBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func actionRegisterButton() {
        // buscando os dados processados na viewModel
        viewModel.didReceiveFormData(email: screen?.getEmail() ?? "", password: screen?.getPassword() ?? "")
       // TO-DO alert success
        // self.alert?.getAlert(titulo: "Bem vindo a bordo!", mensagem: "Usuario criado com Sucesso!")
        
        let mainTabBarController = MainTabBarController()
        mainTabBarController.modalPresentationStyle = .fullScreen
        present(mainTabBarController, animated: true, completion: nil)
        
        
    }
    
}
