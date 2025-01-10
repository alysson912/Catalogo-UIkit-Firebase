//
//  RegisterScreen.swift
//  LoginViewCode
//
//  Created by ALYSSON MENEZES on 17/05/22.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject{
    func actionBackButton()
    func actionRegisterButton()
}

class SignUpWithEmail: UIView {
    
    weak private var delegate : RegisterScreenProtocol?
    
    func delegate( delegate: RegisterScreenProtocol?){
        self.delegate = delegate
    }
    
    private lazy var backGroundView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true // Permitir interações
        view.image = UIImage( named: "signupBackground" )
        return view
    }()
    
    private  lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var imageAddUser: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage( named: "l2")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
        
    private lazy var emailTextField : UITextField = {
        let email = UITextField()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.autocorrectionType = .no
        email.backgroundColor = .white
        email.layer.opacity = 0.9
        email.borderStyle = .roundedRect
        email.keyboardType = .emailAddress
        email.placeholder = "digite seu e-mail:"
        email.font = UIFont.systemFont( ofSize: 14)
        email.textColor = .black
        
        return email
    }()
    
    private lazy var passwordTextField : UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.autocorrectionType = .no
        password.backgroundColor = .white
        password.layer.opacity = 0.9
        password.borderStyle = .roundedRect
        password.isSecureTextEntry = true
        password.placeholder = "digite sua senha:"
        password.font = UIFont.systemFont( ofSize: 14)
        password.textColor = .black
        
        return password
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("cadastrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor( red: 102/255, green: 103/255, blue: 171/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        
        return button
    }()
        
    public func configTextFieldDelegate(delegate: UITextFieldDelegate ){
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    @objc private func tappedBackButton(){
        self.delegate?.actionBackButton()
    }
    
    @objc private func tappedRegisterButton(){
        self.delegate?.actionRegisterButton()
    }
    
    
    public func getEmail() -> String{
        return self.emailTextField.text ?? ""
    }
    
    public func getPassword() -> String{
        return self.passwordTextField.text ?? ""
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews(){
        addSubview(backGroundView)
        backGroundView.addSubview(backButton)
        backGroundView.addSubview(imageAddUser)
        backGroundView.addSubview(emailTextField)
        backGroundView.addSubview(passwordTextField)
        backGroundView.addSubview(registerButton)
    }
    
    override init( frame : CGRect){
        super.init(frame: frame)
        addViews()
        setupConstraints()
       
    }
  
    private func setupConstraints(){
        backGroundView.pin(to: self)
        NSLayoutConstraint.activate([
            
            backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 25),
            backButton.heightAnchor.constraint(equalToConstant: 25),
            
            imageAddUser.topAnchor.constraint(equalTo: self.backButton.bottomAnchor, constant: 100),
            imageAddUser.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageAddUser.widthAnchor.constraint(equalToConstant: 200),
            imageAddUser.heightAnchor.constraint(equalToConstant: 200),
                        
            emailTextField.topAnchor.constraint(equalTo: self.imageAddUser.bottomAnchor, constant: 50),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:  -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 45),
               
            passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 15),
            passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            registerButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 15),
            registerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            registerButton.leadingAnchor.constraint(equalTo: self.passwordTextField.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: self.passwordTextField.trailingAnchor),
            registerButton.heightAnchor.constraint(equalTo: self.passwordTextField.heightAnchor)
            
        ]) }
    
    
    
}
