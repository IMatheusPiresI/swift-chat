//
//  RegisterScreen.swift
//  FlashChatViewCode
//
//  Created by Matheus Sousa on 19/07/23.
//

import UIKit

protocol RegisterScreenDelegate: AnyObject {
    func tappedBackButton()
    func tappedRegisterButton()
    func tappedGoToLogin()
    func tappedEyeShowPassword()
    func tappedEyeShowConfirmPassword()
}

class RegisterScreen: UIView {
    
    private weak var delegate: RegisterScreenDelegate?
    
    public func delegate(delegate: RegisterScreenDelegate){
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
        label.text = "Register"
        label.textColor = .white
        label.font = UIFont(name: K.Fonts.PoppinsBold, size: 28)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = InputForm(placeholderText: "E-mail")
        
        textField.autocapitalizationType = .none
        
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = InputForm(placeholderText: "Password")
        
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    lazy var passwordEyeButton: UIButton = {
        let button = UIButton()
        
        let iconConfiguration = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium, scale: .default)
        let iconImage = UIImage(systemName: "eye.fill", withConfiguration: iconConfiguration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(iconImage, for: .normal)
        button.addTarget(self, action: #selector(tappedEyeShowPassword), for: .touchUpInside)
        
        return button
    }()
    
    lazy var confirmPasswordTextField: UITextField = {
        let textField = InputForm(placeholderText: "Confirm password")
        
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    lazy var confirmPasswordEyeButton: UIButton = {
        let button = UIButton()
        
        let iconConfiguration = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium, scale: .default)
        let iconImage = UIImage(systemName: "eye.fill", withConfiguration: iconConfiguration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(iconImage, for: .normal)
        button.addTarget(self, action: #selector(tappedEyeShowConfirmPassword), for: .touchUpInside)
        
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = Button(title: "Register", action: tappedLoginButton)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var haveAccountButton: UIButton = {
        let button = UIButton()
        let mainString = "Already have an account? Log In."
        let stringToColor = "Log In."
        
        let range = (mainString as NSString).range(of: stringToColor)

        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.pinkBrand, range: range)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(mutableAttributedString, for: .normal)
        button.titleLabel?.font = UIFont(name: K.Fonts.PoppinsBold, size: 12)
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(tappedGoToLogin), for: .touchUpInside)
        
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
        self.addSubview(confirmPasswordTextField)
        self.addSubview(registerButton)
        self.addSubview(haveAccountButton)
        self.addSubview(passwordEyeButton)
        self.addSubview(confirmPasswordEyeButton)
        
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tappedLoginButton() {
        self.delegate?.tappedRegisterButton()
    }
    
    @objc func tappedBackButton(){
        self.delegate?.tappedBackButton()
    }
    
    @objc func tappedGoToLogin(){
        self.delegate?.tappedGoToLogin()
    }
    
    @objc func tappedEyeShowPassword(){
        self.delegate?.tappedEyeShowPassword()
    }
    
    @objc func tappedEyeShowConfirmPassword(){
        self.delegate?.tappedEyeShowConfirmPassword()
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
            
            self.emailTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -40),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 44),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 12),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 44),
            
            self.passwordEyeButton.centerYAnchor.constraint(equalTo: self.passwordTextField.centerYAnchor),
            self.passwordEyeButton.trailingAnchor.constraint(equalTo: self.passwordTextField.trailingAnchor, constant: -16),
            
            self.confirmPasswordTextField.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 12),
            self.confirmPasswordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.confirmPasswordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 44),
            
            self.confirmPasswordEyeButton.centerYAnchor.constraint(equalTo: self.confirmPasswordTextField.centerYAnchor),
            self.confirmPasswordEyeButton.trailingAnchor.constraint(equalTo: self.confirmPasswordTextField.trailingAnchor, constant: -16),
            
            self.registerButton.topAnchor.constraint(equalTo: self.confirmPasswordTextField.bottomAnchor, constant: 48),
            self.registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.registerButton.heightAnchor.constraint(equalToConstant: 44),
            
            self.haveAccountButton.topAnchor.constraint(equalTo: self.registerButton.bottomAnchor, constant: 16),
            self.haveAccountButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.haveAccountButton.heightAnchor.constraint(equalToConstant: 30)
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
