//
//  ViewController.swift
//  Foodie
//
//  Created by Alysson Menezes on 26/12/23.
//



import UIKit

class HomeVC: UIViewController {
    
    private var screen: HomeScreen?
    private var viewModel = HomeViewModel()
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
   override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.dismissKeyboard()
            self.screen?.setupSearchBar(delegate: self)
            self.screen?.setupCollectionView(delegate: self, dataSource: self)
            self.screen?.collectionView.reloadData()
        }
        
    }

}

extension HomeVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) { // qualquer caractere alterado na search sera disparado
        
      //  viewModel.filterSearchText(searchText)
     //   screen?.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) { // quando precionar buscar
        searchBar.resignFirstResponder()
    }
}



extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.item {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardsCollectionViewCell.identifier, for: indexPath) as? CardsCollectionViewCell
            return cell ?? UICollectionViewCell()
            
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeBodyCollectionViewCell.identifier, for: indexPath) as? HomeBodyCollectionViewCell
            return cell ?? UICollectionViewCell()
            
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardBodyCollectionViewCell.identifier, for: indexPath) as? CardBodyCollectionViewCell
            return cell ?? UICollectionViewCell()
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeBodyCollectionViewCell.identifier, for: indexPath) as? HomeBodyCollectionViewCell
            return cell ?? UICollectionViewCell()
         
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel.sizeForItemAt(indexPath: indexPath, frame: collectionView.frame)
    }
    
    
}
    
    


