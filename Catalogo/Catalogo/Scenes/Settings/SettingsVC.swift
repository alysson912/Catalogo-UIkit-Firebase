//
//  SettingsVC.swift
//  Catalogo
//
//  Created by Alysson Menezes on 04/11/24.
//

import UIKit

@MainActor
final class SeetingsViewModel {
    
}

class SettingsVC: UIViewController {
    private var screen: SettingsScreen?
    private var viewModel = AuthenticationManager()
    
    override func loadView() {
        screen = SettingsScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
   override func viewDidLoad() {
        super.viewDidLoad()
       screen?.delegade(delegate: self)
    }

}

extension SettingsVC: SettingsScreenDelegade {
    func tappedButtonAction() {
        try? viewModel.signOut()
        
        let vc = SettingsVC()
        navigationController?.popViewController(animated: true)
    }
    
    
}
