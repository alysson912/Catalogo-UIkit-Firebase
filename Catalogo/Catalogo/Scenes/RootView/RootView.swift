//
//  RootView.swift
//  Catalogo
//
//  Created by Alysson Menezes on 13/09/24.
//

import UIKit

protocol RootViewProtocol: AnyObject {
    func showSignInView() -> UIViewController
}

class RootView: UIView {
    
    weak var delegate: RootViewProtocol?
    public func delegade(delegate: RootViewProtocol?) {
        self.delegate = delegate
    }
    
    lazy var switchAuthenticationView: UIViewController = {
        guard let view = delegate?.showSignInView() else {
            return UIViewController() // Retorna uma view vazia por padrão
        }
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(switchAuthenticationView.view)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        switchAuthenticationView.view.pin(to: self)
        NSLayoutConstraint.activate([ ])
    }
}
