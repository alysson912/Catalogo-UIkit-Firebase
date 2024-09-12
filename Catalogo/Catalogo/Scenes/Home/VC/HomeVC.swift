//
//  ViewController.swift
//  Foodie
//
//  Created by Alysson Menezes on 26/12/23.
//



import UIKit

class HomeVC: UIViewController {
    
    private var screen: HomeScreen?
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
   override func viewDidLoad() {
        super.viewDidLoad()
    
    }

}




    
    


