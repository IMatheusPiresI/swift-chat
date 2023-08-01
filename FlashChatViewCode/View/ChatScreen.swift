//
//  ChatScreen.swift
//  FlashChatViewCode
//
//  Created by Matheus Sousa on 21/07/23.
//

import UIKit

protocol ChatScreenDelegate: AnyObject {
    func tappedLogoutButton()
    func tappedSendMessageButton()
}

class ChatScreen: UIView {
    
    private weak var delegate: ChatScreenDelegate?
    
    public func delegate(delegate: ChatScreenDelegate) {
        self.delegate = delegate
    }
    
    var messages: [MessageModel] = []
    
    lazy var backgroundImageView: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: K.Images.backgroundImageName)
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var headerView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .redDarkBrand
        view.layer.cornerRadius = 28
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.addSubview(horizontalHeaderStack)
        
        return view
    }()
    
    lazy var horizontalHeaderStack: UIStackView = {
        let stack = UIStackView()
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .fill
        stack.addArrangedSubview(logoAppView)
        stack.addArrangedSubview(titleAppLabel)
        stack.addArrangedSubview(logoutButton)
        
        return stack
    }()
    
    lazy var logoAppView: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: K.Images.logo)
        
        return image
    }()
    
    lazy var titleAppLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = K.appName
        label.textColor = .white
        label.font = UIFont(name: K.Fonts.PoppinsBold, size: 20)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var logoutButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: K.Images.logoutSVG), for: .normal)
        button.addTarget(self, action: #selector(tappedLogoutButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var footerView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .redDarkBrand
        view.addSubview(footerStack)
        
        return view
    }()
    
    lazy var footerStack: UIStackView = {
        let stack = UIStackView()
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.addArrangedSubview(messageTextField)
        stack.addArrangedSubview(sendMessageButton)
        stack.spacing = 20
        
        return stack
    }()
    
    lazy var sendMessageButton: UIButton = {
        let button = UIButton()
        
        let iconConfiguration = UIImage.SymbolConfiguration(pointSize: 28, weight: .medium, scale: .default)
        let sendIcon = UIImage(systemName: "paperplane", withConfiguration: iconConfiguration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(sendIcon, for: .normal)
        button.addTarget(self, action: #selector(tappedSendMessageButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var messageTextField: UITextField = {
        let input = UITextField()
        
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        
        input.translatesAutoresizingMaskIntoConstraints = false
        input.attributedPlaceholder = NSAttributedString(string: "Type your message...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        input.textColor = .black
        input.backgroundColor = .white
        input.clipsToBounds = true
        input.layer.cornerRadius = 8
        input.leftView = padding
        input.leftViewMode = .always
        input.rightView = padding
        input.rightViewMode = .always
        
        return input
    }()
    
    lazy var messagesTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.register(MessageCell.self, forCellReuseIdentifier: MessageCell.idetifier)
        tableView.estimatedRowHeight = 50
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(backgroundImageView)
        self.addSubview(headerView)
        self.addSubview(footerView)
        self.addSubview(messagesTableView)
        
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedLogoutButton() {
        self.delegate?.tappedLogoutButton()
    }
    
    @objc func tappedSendMessageButton() {
        self.delegate?.tappedSendMessageButton()
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            self.backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.headerView.topAnchor.constraint(equalTo: self.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.headerView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 80),
            
            self.horizontalHeaderStack.bottomAnchor.constraint(equalTo: self.headerView.bottomAnchor, constant: -20),
            self.horizontalHeaderStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.horizontalHeaderStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.logoAppView.heightAnchor.constraint(equalToConstant: 40),
            self.logoAppView.widthAnchor.constraint(equalToConstant: 40),
            
            self.footerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.footerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            self.footerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.footerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.footerStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.footerStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.footerStack.topAnchor.constraint(equalTo: self.footerView.topAnchor, constant: 10),
            
            self.sendMessageButton.widthAnchor.constraint(equalToConstant: 40),
            self.sendMessageButton.heightAnchor.constraint(equalToConstant: 40),
            
            self.messageTextField.heightAnchor.constraint(equalToConstant: 40),
            
            self.messagesTableView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor),
            self.messagesTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.messagesTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.messagesTableView.bottomAnchor.constraint(equalTo: self.footerView.topAnchor)
        ])
    }
}

extension ChatScreen: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = self.messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageCell.idetifier, for: indexPath) as! MessageCell
        
        if let user = UserSingleton.shared.user {
            cell.configure(message: message, currentUser: user)
            return cell
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
