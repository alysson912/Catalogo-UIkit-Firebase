//
//  SettingsVC.swift
//  Catalogo
//
//  Created by Alysson Menezes on 04/11/24.
//

import UIKit

class SettingsVC: UIViewController {
    private var screen: SettingsView?
    private var viewModel = SettingsViewModel()
    
    override func loadView() {
        screen = SettingsView()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        viewModel.loadAuthProviders()
        viewModel.loadAuthUser()
        showEmailSection()
        showAnonymounsSection()
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegade(delegate: self)
        screen?.configTableViewProtocols(delegate: self, dataSource: self)
    }
    
    func deveEsconderItemNoIndex(_ index: Int) -> Bool {
        // Lógica para definir se deve esconder o item no índice especificado
        return index == 3  // Exemplo: esconder o item no índice 3
    }
    
    // ao logar com google remova todas as opcoes referentes a email
    func showEmailSection() {
        if viewModel.authProviders.contains(.google) {
            viewModel.options.removeAll()//remove(atOffsets: [0,1,2])
            
        }
    }
    // TO-DO fazer verificacao antes de implementar
    func showAnonymounsSection() {
        if viewModel.authUser?.isAnonymous == true {
            viewModel.options.removeAll()
            viewModel.options.append(
                SetupEmailSection(leadingIconOption: "person.circle", titleLabel: "Link Google Account", trailingIconOption: "arrow.forward"))
            
            viewModel.options.append(
                SetupEmailSection(leadingIconOption: "person.circle", titleLabel: "Link E-mail Account", trailingIconOption: "arrow.forward"))
        }
    }
    
}

extension SettingsVC: SettingsScreenDelegade {
    func tappedLogOutActionButton() {
        try? viewModel.signOut()
        
        let vc = AuthenticationVC()
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true, completion: nil)
    }
    
}



extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: EmailSectionTableViewCell.identifier, for: indexPath) as? EmailSectionTableViewCell
        
        if deveEsconderItemNoIndex(indexPath.row) {  // Condição para esconder a célula
            cell?.isHidden = true
        } else {
            cell?.setupCell(option: viewModel.loadCurrentLastesDeal(indexPath: indexPath))
        }
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if deveEsconderItemNoIndex(indexPath.row) {  // Condição para esconder a célula
            return  viewModel.heightForRowAt
           }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        Task {
            await  viewModel.swithOptions(indexPath: indexPath)
        }
        
    }
    
}
