//
//  AnonymousSectionTableViewCell.swift
//  Catalogo
//
//  Created by ALYSSON MENEZES on 07/02/25.
//

import UIKit

class AnonymousSectionTableViewCell: UITableViewCell {
    
    static let identifier: String = String( describing: AnonymousSectionTableViewCell.self)
    
    private lazy var screen: AnonymousSectionScreen = {
        let view = AnonymousSectionScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(screen)
        screen.pin(to: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // setup cells
    
    public func setupCell(option: SetupEmailSection){
        screen.leadingIconOption.image = UIImage(systemName: option.leadingIconOption)
        screen.titleLabel.text = option.titleLabel
        screen.trailingIconOption.image = UIImage(systemName: option.trailingIconOption)
    }
}

