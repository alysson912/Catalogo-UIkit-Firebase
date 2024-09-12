//
//  HomeScreen.swift
//  Foodie
//
//  Created by Alysson Menezes on 26/12/23.
//

import UIKit

class HomeScreen: UIView {
    
    lazy var viewBackGround: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .orange //UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        return view
    }()
    
    
    private func addViews(){
        addSubview(viewBackGround)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstrains() {
        viewBackGround.pin(to: self)
        NSLayoutConstraint.activate( [ 
       
            
        ])
    }
}
