//
//  MainTabBarController.swift
//  RastreioBF
//
//  Created by Jessica Bigal on 09/09/22.
//

import UIKit

class MainTabBarController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTabBarController()
        configNavigationBar()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func configTabBarController() {
        let homeVC = UINavigationController(rootViewController: HomeVC())
//        let searchVC = UINavigationController(rootViewController: SearchVC())
//        let settingsVC = UINavigationController(rootViewController: MenuVC())
//        let requestVC = UINavigationController(rootViewController: RequestVC())
        
        setViewControllers([homeVC], animated: true)
        
       
        tabBar.tintColor = .red
        tabBar.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        tabBar.alpha = 1
        tabBar.isTranslucent = false
        
        guard let items = tabBar.items else {return}
        
        items[0].title = "Home"
        items[0].image = UIImage(systemName: "house.fill")
        
//        items[1].title = "Buscar"
//        items[1].image = UIImage(systemName: "magnifyingglass")
//        
//        items[2].title = "Pedidos"
//        items[2].image = UIImage(systemName: "list.bullet")
//        
//        items[3].title = "Settings"
//        items[3].image = UIImage(systemName: "gearshape")
        
       
        //
        //        items[2].title = LC.menuTitleTab.text
        //        items[2].image = UIImage(systemName: LC.menuIcon.text)
    }
    
    private func configNavigationBar(){
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.red]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
}

extension UINavigationBar {
    func customNavigationBar() {
        prefersLargeTitles = false
        largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemPink]
        titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemPink]
    }
}
