//
//  Alert.swift
//  LoginViewCode
//
//  Created by ALYSSON MENEZES on 25/05/22.
//

import Foundation
import UIKit

class Alert:NSObject{
    
    var controller:UIViewController // criando classe controladora do alert, informando quem vai ser a controladora do alert
    
    init(controller:UIViewController) { // pegando instancia para dentro do construtor
        self.controller = controller
    }
    
    // chamando um alert
    func getAlert(titulo:String, mensagem:String, completion:(() -> Void)? = nil){// completion = botao de ação (opcional)
        let alertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert) // configurando alert(caixa externa)
        let cancelar = UIAlertAction(title: "Ok", style: .cancel) { acao in completion?()} // configurando botao
        alertController.addAction(cancelar)// adicioanndo botao dentro do alert controller
        
        self.controller.present(alertController, animated: true, completion: nil) // ação ao clicar
    }
    
    
    func addContact(completion:((_ value:String) -> Void)? = nil){
        var _textField:UITextField?
        let alert = UIAlertController(title: "Adicionar Usuario", message: "Digite uma email Valido", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Adicionar", style: .default) { (acao) in
            completion?(_textField?.text ?? "")
        }
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addTextField(configurationHandler: {(textField: UITextField) in
            _textField = textField
            textField.placeholder = "Email:"
        })
        self.controller.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
    
}
