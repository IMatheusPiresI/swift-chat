//
//  LoginScreen.swift
//  FlashChatViewCode
//
//  Created by Matheus Sousa on 19/07/23.
//

import UIKit

protocol LoginScreenDelegate: AnyObject {
    func tappedBackButton()
    func tappedLoginButton()
    func tappedGoToRegister()
    func tappedEyeShowPassword()
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenDelegate?
    
    public func delegate(delegate: LoginScreenDelegate){
        self.delegate = delegate
    }
    
    lazy var backgroundRedImageView: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: K.Images.backgroundImageName)
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        
        let iconConfiguration = UIImage.SymbolConfiguration(pointSize: 32, weight: .medium)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.left", withConfiguration: iconConfiguration)?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: K.Images.logo)
        
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
       
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Log in"
        label.textColor = .white
        label.font = UIFont(name: K.Fonts.PoppinsBold, size: 28)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var emailTextField: InputForm = {
        let textField = InputForm(placeholderText: "E-mail")
        
        textField.text = ""
        return textField
    }()
    
    lazy var passwordTextField: InputForm = {
        let textField = InputForm(placeholderText: "Password")
        
        textField.text = ""
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var eyeButton: UIButton = {
        let button = UIButton()
        
        let iconConfiguration = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium, scale: .default)
        let iconImage = UIImage(systemName: "eye.fill", withConfiguration: iconConfiguration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(iconImage, for: .normal)
        button.addTarget(self, action: #selector(tappedEyeShowPassword), for: .touchUpInside)
        
        return button
    }()
    
    lazy var loginButton: UIButton = {
        let button = Button(title: "Login", action: tappedLoginButton)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var notAccountButton: UIButton = {
        let button = UIButton()
        let mainString = "Don't have an account? Register."
        let stringToColor = "Register."
        
        let range = (mainString as NSString).range(of: stringToColor)

        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.pinkBrand, range: range)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(mutableAttributedString, for: .normal)
        button.titleLabel?.font = UIFont(name: K.Fonts.PoppinsBold, size: 12)
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(tappedGoToRegister), for: .touchUpInside)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(backgroundRedImageView)
        self.addSubview(backButton)
        self.addSubview(logoImageView)
        self.addSubview(titleLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(notAccountButton)
        self.addSubview(eyeButton)
        
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tappedLoginButton(){
        self.delegate?.tappedLoginButton()
    }
    
    @objc func tappedBackButton(){
        self.delegate?.tappedBackButton()
    }
    
    @objc func tappedGoToRegister(){
        self.delegate?.tappedGoToRegister()
    }
    
    @objc func tappedEyeShowPassword(){
        self.delegate?.tappedEyeShowPassword()
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            self.backgroundRedImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundRedImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.backgroundRedImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundRedImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
        
            self.logoImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 80),
            self.logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 32),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.emailTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -22),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 44),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 12),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 44),
            
            self.eyeButton.centerYAnchor.constraint(equalTo: self.passwordTextField.centerYAnchor),
            self.eyeButton.trailingAnchor.constraint(equalTo: self.passwordTextField.trailingAnchor, constant: -16),
            
            self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 48),
            self.loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.loginButton.heightAnchor.constraint(equalToConstant: 44),
            
            self.notAccountButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 16),
            self.notAccountButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.notAccountButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
