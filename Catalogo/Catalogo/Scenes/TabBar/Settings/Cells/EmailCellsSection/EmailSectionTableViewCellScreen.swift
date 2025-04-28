//
//  SettingsOptionTableViewCellScreen.swift
//  Catalogo
//
//  Created by ALYSSON MENEZES on 04/02/25.
//

import UIKit

class EmailSectionTableViewCellScreen: UIView {
    
    lazy var leadingIconOption : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(systemName: "person.circle.fill")
        image.layer.borderColor = UIColor.white.cgColor
        image.tintColor = .red
        
        //image.backgroundColor = .red
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "teste"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    lazy var trailingIconOption : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .blue
        image.image = UIImage(systemName: "arrow.forward")
        //image.backgroundColor = .red
        return image
    }()
    
    private func addViews(){
        addSubview(titleLabel)
        addSubview(leadingIconOption)
        addSubview(trailingIconOption)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        addViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    private func configConstraints() {
        NSLayoutConstraint.activate([
        
            //iconOption.centerYAnchor.constraint(equalTo: centerYAnchor),
            leadingIconOption.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            leadingIconOption.centerYAnchor.constraint(equalTo: centerYAnchor),
            leadingIconOption.heightAnchor.constraint(equalToConstant: 25),
            leadingIconOption.widthAnchor.constraint(equalToConstant: 25),
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            trailingIconOption.centerYAnchor.constraint(equalTo: centerYAnchor),
            trailingIconOption.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 5),
            trailingIconOption.heightAnchor.constraint(equalToConstant: 25),
            trailingIconOption.widthAnchor.constraint(equalToConstant: 25),
            trailingIconOption.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            
        ])
    }
}
