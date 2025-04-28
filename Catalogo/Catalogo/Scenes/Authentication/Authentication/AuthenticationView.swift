//
//  AuthenticationView.swift
//  Catalogo
//
//  Created by Alysson Menezes on 04/09/24.
//

import UIKit
import GoogleSignIn
import GoogleSignInSwift

protocol AuthenticationViewProtocol: AnyObject {
    func actionSignInWithEmailButton()
    func actionSignInWithGoogle()
    func actionSignInWithAnonymously()
}

class AuthenticationView: UIView {
    
    private weak var delegate: AuthenticationViewProtocol?
    
    public func delegate(delegate: AuthenticationViewProtocol?) {
        self.delegate = delegate
    }
        
    lazy var viewBackGround : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isUserInteractionEnabled = true // Permitir interações
        image.image = UIImage( named: "gsl" )
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sign In!"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        return label
    }()
    
    lazy var signInWithEmailButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.isEnabled = true
        btn.backgroundColor = .orange
        btn.setTitle("Entrar", for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 8
        btn.addTarget(self, action: #selector(tappedSignInWithEmail), for: .touchUpInside)
        return btn
    }()
    
    @objc private func tappedSignInWithEmail() {
        delegate?.actionSignInWithEmailButton()
    }

    lazy var signInWithGoogleButton: GIDSignInButton = {
        let btn = GIDSignInButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.style = .wide
        btn.addTarget(self, action: #selector(tappedSignInWithGoogle), for: .touchUpInside)
        return btn
    }()
        
    @objc private func tappedSignInWithGoogle() {
        delegate?.actionSignInWithGoogle()
    }
    
    lazy var signInWithAnonymouslyButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.isEnabled = true
        btn.backgroundColor = .backGround
        btn.setTitle("Sign in with Anonymously", for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 8
        btn.addTarget(self, action: #selector(tappedSignInWithAnonymouslyButton), for: .touchUpInside)
        return btn
    }()
    
    @objc private func tappedSignInWithAnonymouslyButton() {
        delegate?.actionSignInWithAnonymously()
    }
    
    private func addViews() {
        addSubview(viewBackGround)
        viewBackGround.addSubview(titleLabel)
        viewBackGround.addSubview(signInWithEmailButton)
        viewBackGround.addSubview(signInWithGoogleButton)
        viewBackGround.addSubview(signInWithAnonymouslyButton)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        viewBackGround.pin(to: self)
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            signInWithEmailButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            signInWithEmailButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            signInWithEmailButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            signInWithEmailButton.heightAnchor.constraint(equalToConstant: 55),
            
            signInWithGoogleButton.topAnchor.constraint(equalTo: signInWithEmailButton.bottomAnchor, constant: 10),
            signInWithGoogleButton.leadingAnchor.constraint(equalTo: signInWithEmailButton.leadingAnchor),
            signInWithGoogleButton.trailingAnchor.constraint(equalTo: signInWithEmailButton.trailingAnchor),
            signInWithGoogleButton.heightAnchor.constraint(equalToConstant: 55),
            
            signInWithAnonymouslyButton.topAnchor.constraint(equalTo: signInWithGoogleButton.bottomAnchor, constant: 10),
            signInWithAnonymouslyButton.leadingAnchor.constraint(equalTo: signInWithGoogleButton.leadingAnchor),
            signInWithAnonymouslyButton.trailingAnchor.constraint(equalTo: signInWithGoogleButton.trailingAnchor),
            signInWithAnonymouslyButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
