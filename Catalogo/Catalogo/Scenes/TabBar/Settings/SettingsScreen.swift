//
//  SettingsScreen.swift
//  Catalogo
//
//  Created by Alysson Menezes on 04/11/24.
//

import UIKit

protocol SettingsScreenDelegade: AnyObject {
    func tappedLogOutActionButton()
    func tappedResetPasswordButtonAction() async
    func tappedUpdatePasswordButtonAction() async
    func tappedUpdateEmailButtonAction() async
}

class SettingsScreen: UIView {
    
    private weak var delegate: SettingsScreenDelegade?
    
    public func delegade(delegate: SettingsScreenDelegade?) {
        self.delegate = delegate
    }
    
    lazy var viewBackGround: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor =  UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Settings"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    lazy var logOutButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .red
        btn.setTitle("logOut", for: .normal)
        btn.setBackgroundImage(UIImage( named: "gradient3"), for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius =  8
        btn.contentMode = .scaleAspectFill
        btn.addTarget(self, action: #selector(tappedLogOutButton), for: .touchUpInside)
        return btn
    }()
    
    lazy var resetPasswordButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .blue
        btn.setTitle("reset Password", for: .normal)
        btn.setBackgroundImage(UIImage( named: "gradient3"), for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius =  8
        btn.contentMode = .scaleAspectFill
        btn.addTarget(self, action: #selector(tappedResetPasswordButton), for: .touchUpInside)
        return btn
    }()
    
    lazy var updatePasswordButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .purple
        btn.setTitle("updatePassword", for: .normal)
        btn.setBackgroundImage(UIImage( named: "gradient3"), for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius =  8
        btn.contentMode = .scaleAspectFill
        btn.addTarget(self, action: #selector(tappedUpdatePasswordButton), for: .touchUpInside)
        return btn
    }()
    
    lazy var updateEmailButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .darkGray
        btn.setTitle("updateEmail", for: .normal)
        btn.setBackgroundImage(UIImage( named: "gradient3"), for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius =  8
        btn.contentMode = .scaleAspectFill
        btn.addTarget(self, action: #selector(tappedUpdateEmailButton), for: .touchUpInside)
        return btn
    }()
    
    @objc func tappedLogOutButton() {
        delegate?.tappedLogOutActionButton()
    }
    
    //Task é usado para criar um contexto assíncrono dentro de métodos síncronos. Isso é ideal para integrar chamadas assíncronas a métodos como @objc.
    @objc func tappedResetPasswordButton()  {
        Task {
            // [weak self] in //Para evitar ciclos de retenção, o bloco usa [weak self].
            await delegate?.tappedResetPasswordButtonAction()
        }
    }
    
    @objc func tappedUpdatePasswordButton()  {
        
        Task {
            await delegate?.tappedUpdatePasswordButtonAction()
        }
    }
    
    @objc func tappedUpdateEmailButton()  {
        Task {
            await delegate?.tappedUpdateEmailButtonAction()
        }
    }
    
    private func addViews(){
        addSubview(viewBackGround)
        viewBackGround.addSubview(titleLabel)
        viewBackGround.addSubview(logOutButton)
        viewBackGround.addSubview(resetPasswordButton)
        viewBackGround.addSubview(updatePasswordButton)
        viewBackGround.addSubview(updateEmailButton)
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
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            updateEmailButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 45),
            updateEmailButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            updateEmailButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            updateEmailButton.heightAnchor.constraint(equalToConstant: 65),
            
            updatePasswordButton.topAnchor.constraint(equalTo: updateEmailButton.bottomAnchor, constant: 10),
            updatePasswordButton.leadingAnchor.constraint(equalTo: updateEmailButton.leadingAnchor),
            updatePasswordButton.trailingAnchor.constraint(equalTo: updateEmailButton.trailingAnchor),
            updatePasswordButton.heightAnchor.constraint(equalToConstant: 65),
            
            resetPasswordButton.topAnchor.constraint(equalTo: updatePasswordButton.bottomAnchor, constant: 10),
            resetPasswordButton.leadingAnchor.constraint(equalTo: updatePasswordButton.leadingAnchor),
            resetPasswordButton.trailingAnchor.constraint(equalTo: updatePasswordButton.trailingAnchor),
            resetPasswordButton.heightAnchor.constraint(equalToConstant: 65),
            
            logOutButton.topAnchor.constraint(equalTo: resetPasswordButton.bottomAnchor, constant: 10),
            logOutButton.leadingAnchor.constraint(equalTo: resetPasswordButton.leadingAnchor),
            logOutButton.trailingAnchor.constraint(equalTo: resetPasswordButton.trailingAnchor),
            logOutButton.heightAnchor.constraint(equalToConstant: 65),
            
            
        ])
    }
}
