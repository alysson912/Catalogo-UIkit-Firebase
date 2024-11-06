//
//  SettingsScreen.swift
//  Catalogo
//
//  Created by Alysson Menezes on 04/11/24.
//

import UIKit

protocol SettingsScreenDelegade: AnyObject {
    func tappedButtonAction()
}

class SettingsScreen: UIView {
    
    private weak var delegate: SettingsScreenDelegade?
    
    public func delegade(delegate: SettingsScreenDelegade?) {
        self.delegate = delegate
    }
    
    lazy var viewBackGround: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green //UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        return view
    }()
    
    lazy var logOutButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .black
        btn.setTitle("logOut", for: .normal)
        btn.setBackgroundImage(UIImage( named: "gradient3"), for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius =  8
        btn.contentMode = .scaleAspectFill
        btn.addTarget(self, action: #selector(tappedLogOutButton), for: .touchUpInside)
        return btn
    }()
    
    @objc func tappedLogOutButton() {
        delegate?.tappedButtonAction()
    }
    
    private func addViews(){
        addSubview(viewBackGround)
        viewBackGround.addSubview(logOutButton)
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
       
            logOutButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25),
            logOutButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            logOutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            logOutButton.heightAnchor.constraint(equalToConstant: 65)
        ])
    }
}
