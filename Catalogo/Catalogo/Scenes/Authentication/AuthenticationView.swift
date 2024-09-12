//
//  AuthenticationView.swift
//  Catalogo
//
//  Created by Alysson Menezes on 04/09/24.
//

import UIKit

protocol AuthenticationViewProtocol: AnyObject {
    func actionSignInWithEmailButton()
}

class AuthenticationView: UIView {
    
    private weak var delegate: AuthenticationViewProtocol?
    
    public func delegate(delegate: AuthenticationViewProtocol?) {
        self.delegate = delegate
    }
    
    lazy var viewBackGround: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        return view
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
    
    private func addViews() {
        addSubview(viewBackGround)
        viewBackGround.addSubview(titleLabel)
        viewBackGround.addSubview(signInWithEmailButton)
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
            signInWithEmailButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
