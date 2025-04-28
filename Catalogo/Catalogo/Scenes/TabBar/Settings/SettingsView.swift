//
//  SettingsScreen.swift
//  Catalogo
//
//  Created by Alysson Menezes on 04/11/24.
//

import UIKit

protocol SettingsScreenDelegade: AnyObject {
    func tappedLogOutActionButton()
}

class SettingsView: UIView {
    
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
    
    lazy var settingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //tableView.separatorStyle = .none // retirando linhas
        tableView.showsVerticalScrollIndicator = false // desativando scrool indicator
        tableView.isScrollEnabled = false
        tableView.layer.cornerRadius = 12
        tableView.separatorStyle = .singleLine
        // TO DO: Register
        tableView.register(EmailSectionTableViewCell.self, forCellReuseIdentifier: EmailSectionTableViewCell.identifier)
        tableView.register(AnonymousSectionTableViewCell.self, forCellReuseIdentifier: AnonymousSectionTableViewCell.identifier)
        
        tableView.backgroundColor = .clear//UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        return tableView
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
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        settingsTableView.delegate = delegate
        settingsTableView.dataSource = dataSource
     }
    
    @objc func tappedLogOutButton() {
        delegate?.tappedLogOutActionButton()
    }
    
    //Task é usado para criar um contexto assíncrono dentro de métodos síncronos. Isso é ideal para integrar chamadas assíncronas a métodos como @objc.
   
    private func addViews(){
        addSubview(viewBackGround)
        viewBackGround.addSubview(titleLabel)
        viewBackGround.addSubview(settingsTableView)
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
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            settingsTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 14),
            settingsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            settingsTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            settingsTableView.heightAnchor.constraint(equalToConstant: 450.0),
            
            logOutButton.topAnchor.constraint(equalTo: settingsTableView.bottomAnchor, constant: 10),
            logOutButton.leadingAnchor.constraint(equalTo: settingsTableView.leadingAnchor),
            logOutButton.trailingAnchor.constraint(equalTo: settingsTableView.trailingAnchor),
            logOutButton.heightAnchor.constraint(equalToConstant: 65),
        ])
    }
}
