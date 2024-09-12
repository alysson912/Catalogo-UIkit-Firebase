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

class RegisterScreen: UIView {
    
    weak private var delegate : RegisterScreenProtocol?
    
    func delegate( delegate: RegisterScreenProtocol?){
        self.delegate = delegate
    }
    
    lazy var backGroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray//UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        return view
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "backButtonIcon"), for: .normal)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    lazy var imageAddUser: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage( named: "l2")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var nameTextField : UITextField = {
        let email = UITextField()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.autocorrectionType = .no
        email.backgroundColor = .clear
        email.borderStyle = .roundedRect
        email.placeholder = "digite seu Nome:"
        email.font = UIFont.systemFont( ofSize: 14)
        email.textColor = .white
        
        return email
    }()
    
    lazy var emailTextField : UITextField = {
        let email = UITextField()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.autocorrectionType = .no
        email.backgroundColor = .clear
        email.borderStyle = .roundedRect
        email.keyboardType = .emailAddress
        email.placeholder = "digite seu e-mail:"
        email.font = UIFont.systemFont( ofSize: 14)
        email.textColor = .white
        
        return email
    }()
    

    
    lazy var passwordTextField : UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.autocorrectionType = .no
        password.backgroundColor = .clear
        password.borderStyle = .roundedRect
        password.isSecureTextEntry = true
        password.placeholder = "digite sua senha:"
        password.font = UIFont.systemFont( ofSize: 14)
        password.textColor = .white
        
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
    
    
    public func configTextFieldDelegate( delegate:UITextFieldDelegate ){
        nameTextField.delegate = delegate
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    @objc private func tappedBackButton(){
        self.delegate?.actionBackButton()
    }
    
    @objc private func tappedRegisterButton(){
        self.delegate?.actionRegisterButton()
    }
    
    public func validarTextFields(){
        let name: String = self.nameTextField.text ?? ""
        let email: String = self.emailTextField.text ?? ""
        let password: String = self.passwordTextField.text ?? ""
        
        if !name.isEmpty && !email.isEmpty && !password.isEmpty {
            self.configButtonEnable(true)
        }else{
            self.configButtonEnable(false)
        }
    }
    
    private func configButtonEnable(_ enable : Bool ){
        if enable{
            self.registerButton.setTitleColor(.white, for: .normal)
            self.registerButton.isEnabled = true
        }else {
            self.registerButton.setTitleColor(.lightGray, for: .normal)
            self.registerButton.isEnabled = false
        }
    }
    
    public func getName() -> String{
        return self.nameTextField.text ?? ""
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
        backGroundView.addSubview(nameTextField)
        backGroundView.addSubview(emailTextField)
        backGroundView.addSubview(passwordTextField)
        backGroundView.addSubview(registerButton)
        
    }
    
    override init( frame : CGRect){
        super.init(frame: frame)
        addViews()
        setupConstraints()
        configButtonEnable(false)
        
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
            
            nameTextField.topAnchor.constraint(equalTo: self.imageAddUser.bottomAnchor, constant: 50),
            nameTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:  -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 45),
            
            emailTextField.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 15),
            emailTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
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
