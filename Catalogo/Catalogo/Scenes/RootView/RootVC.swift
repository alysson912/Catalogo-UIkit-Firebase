//
//  RootVC.swift
//  Catalogo
//
//  Created by Alysson Menezes on 13/09/24.
//

import UIKit

protocol AuthenticationCompletionDelegate: AnyObject {
    func didCompleteAuthentication()
}


class RootVC: UIViewController {
    var screen: RootView?
    let authenticationManager = AuthenticationManager()
    
    override func loadView() {
        screen = RootView()
        screen?.delegate = self
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
           navigationController?.isNavigationBarHidden = true
        
       }

    // Função para adicionar o view controller retornado por showSignInView()
      private func showChildViewController() {
          let viewController = screen?.delegate?.showSignInView()
    
          guard let childVC = viewController else { return }
          
          addChild(childVC) // Adiciona o controlador como filho
          view.addSubview(childVC.view) // Adiciona a view do controlador à hierarquia de views
          childVC.view.frame = view.bounds // Ajusta o frame da view
          childVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight] // Garante redimensionamento
          childVC.didMove(toParent: self) // Notifica o controlador filho que foi adicionado
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showChildViewController()
    }
}

extension RootVC: RootViewProtocol {
    func showSignInView() -> UIViewController {
        let authUser = try? authenticationManager.getAuthenticateUser()
        
        if authUser == nil {
            let signInVC = AuthenticationVC()
            return signInVC
        } else {
            return MainTabBarController()
        }
    }
}









