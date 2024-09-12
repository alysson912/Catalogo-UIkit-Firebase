//
//  SignInEmailView.swift
//  Catalogo
//
//  Created by Alysson Menezes on 04/09/24.
//

import UIKit

protocol SignInEmailViewProtocol: AnyObject {
    func actionSignInButton()
    func actionRegisterButton()
}

class SignInEmailView: UIView {
    
    private weak var delegate: SignInEmailViewProtocol?
    
    public func delegate(delegate: SignInEmailViewProtocol?) {
        self.delegate = delegate
    }
    
    lazy var viewBackGround: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 23/255, green: 242/255, blue: 90/255, alpha: 1.0)
        return view
    }()
    
    lazy var signInWithEmailTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sign In With Email!"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 0.8)
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress // defaut
        tf.attributedPlaceholder = NSAttributedString(string: "E-mail: user@outlook.com", attributes: [ NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.4)]) // cor customizada
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 8
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        
        // tf.text = "almenezes912@gmail.com"
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 0.8)
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default // defaut
        tf.attributedPlaceholder = NSAttributedString(string: "password: aaa@123#", attributes: [ NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.4)]) // cor customizada
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 8
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        
        // tf.text = "almenezes912@gmail.com"
        return tf
    }()
    
    lazy var signInButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("entrar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor( red: 102/255, green: 103/255, blue: 171/255, alpha: 1.0)
        button.addTarget(self , action: #selector(self.tappedSignInButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedSignInButton() {
        self.delegate?.actionSignInButton()
    }
    
    lazy var registerButton : UIButton = {
        let register = UIButton()
        register.translatesAutoresizingMaskIntoConstraints = false
        register.setTitle("cadastre-se", for: .normal)
        register.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        register.setTitleColor(.darkGray, for: .normal)
        register.addTarget(self, action: #selector(tappedRegisterButton) , for: .touchUpInside)
        return register
    }()
    
    @objc private func tappedRegisterButton(){
        self.delegate?.actionRegisterButton()
    }
    
    func configTextFieldDelegate( delegate: UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    public func getEmail() -> String{
        return self.emailTextField.text ?? ""
    }
    
    public func getPassword() -> String{
        return self.passwordTextField.text ?? ""
    }
    
    private func configButtonEnable(_ enable : Bool ){
        if enable{
            self.signInButton.setTitleColor(.white, for: .normal)
            self.signInButton.isEnabled = true
        }else {
            self.signInButton.setTitleColor(.lightGray, for: .normal)
            self.signInButton.isEnabled = false
        }
    }
    
    public func validateTextFields(){
        let email: String = self.emailTextField.text ?? ""
        let password: String = self.passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty{
            self.configButtonEnable(true)
        }else{
            self.configButtonEnable(false)
        }
    }
    
    private func addViews() {
        addSubview(viewBackGround)
        viewBackGround.addSubview(signInWithEmailTitleLabel)
        viewBackGround.addSubview(emailTextField)
        viewBackGround.addSubview(passwordTextField)
        viewBackGround.addSubview(signInButton)
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
            
            signInWithEmailTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            signInWithEmailTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            signInWithEmailTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: signInWithEmailTitleLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: signInWithEmailTitleLabel.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 65),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 65),
            
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            signInButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 65)
        ])
    }
    
}
