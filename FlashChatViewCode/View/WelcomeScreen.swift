//
//  WelcomeScreen.swift
//  FlashChatViewCode
//
//  Created by Matheus Sousa on 19/07/23.
//

import UIKit

protocol WelcomeScreenDelegate: AnyObject {
    func tappedLoginButton()
    func tappedRegisterButton()
}

class WelcomeScreen: UIView {
    
    private weak var delegate: WelcomeScreenDelegate?
    
    public func delegate(delegate: WelcomeScreenDelegate) {
        self.delegate = delegate
    }
    
    lazy var backgroundRedImageView: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: K.Images.backgroundImageName)
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: K.Images.logo)
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome to PChat"
        label.textColor = .white
        label.font = UIFont(name: K.Fonts.PoppinsBold, size: 28)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var registerButton: UIButton = {
        let button = Button(title: "Register", action: registerButtonPressed)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var loginButton: UIButton = {
        let button = Button(title: "Log In", action: loginButtonPressed)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(backgroundRedImageView)
        self.addSubview(logoImageView)
        self.addSubview(welcomeLabel)
        self.addSubview(registerButton)
        self.addSubview(loginButton)
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loginButtonPressed() {
        self.delegate?.tappedLoginButton()
    }
    
    func registerButtonPressed() {
        self.delegate?.tappedRegisterButton()
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            self.backgroundRedImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundRedImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.backgroundRedImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundRedImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.logoImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 80),
            self.logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.welcomeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.welcomeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.welcomeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            self.registerButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            self.registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.registerButton.heightAnchor.constraint(equalToConstant: 44),
            
            self.loginButton.bottomAnchor.constraint(equalTo: self.registerButton.topAnchor, constant: -18),
            self.loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.loginButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
