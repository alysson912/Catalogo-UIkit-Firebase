//
//  ViewController.swift
//  Foodie
//
//  Created by Alysson Menezes on 26/12/23.
//



import UIKit

@MainActor
final class MenuViewModel {
    
}

 class HomeVC: UIViewController {
    
    private var screen: HomeView?
    
    override func loadView() {
        screen = HomeView()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
   override func viewDidLoad() {
        super.viewDidLoad()
    
    }

}




    
    


