//
//  SignInEmailViewModel.swift
//  Catalogo
//
//  Created by Alysson Menezes on 04/09/24.
//

import Foundation
import FirebaseAuth

final class SignInEmaiViewModel {
    private var login = SignInEmailView()
    
    private var auth: Auth?
    private var alert: Alert?

    func signIn() {
        auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { usuario, error in
            if error != nil {
                self.alert?.getAlert(titulo: "Atenção", mensagem: "Dados Incorretos,verifique e tente Novamente!!")
            } else {
                if usuario == nil {
                    self.alert?.getAlert(titulo: "Atenção", mensagem: "Tivemos um problema inesperado, tente novamente mais tarde")
                } 
            }
            
        })
    }
    
}

