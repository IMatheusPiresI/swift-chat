//
//  MessageCellTableViewCell.swift
//  FlashChatViewCode
//
//  Created by Matheus Sousa on 22/07/23.
//

import UIKit

class MessageCell: UITableViewCell {
    
    static let idetifier = K.messageCellIdentifier
    

    lazy var boxLetterView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .pinkPrimaryBrand
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.addSubview(labelLetter)
        
        return view
    }()
    
    lazy var otherBoxLetterView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .pinkPrimaryBrand
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.addSubview(otherLabelLetter)
        
        return view
    }()
    
    lazy var labelLetter: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: K.Fonts.PoppinsBold, size: 12)
        label.text = "Y"
        
        return label
    }()
    
    lazy var otherLabelLetter: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: K.Fonts.PoppinsBold, size: 12)
        label.text = "Y"
        
        return label
    }()
    
    lazy var messageContentLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Content Message  [Warning] Warning once only: Detected a case where constraints ambiguously suggest a height of zero for a table view cell's content view."
        label.textColor = .white
        label.font = UIFont(name: K.Fonts.PoppinsMedium, size: 14)
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var messageView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .redBrand
        view.addSubview(messageContentLabel)
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.directionalLayoutMargins = NSDirectionalEdgeInsets.init(top: 6, leading: 8, bottom: 6, trailing: 8)
        
        return view
    }()
    
    override func prepareForReuse() {
        otherBoxLetterView.isHidden = false
        boxLetterView.isHidden = false
        messageView.backgroundColor = .redBrand
        boxLetterView.backgroundColor = .pinkPrimaryBrand
        otherBoxLetterView.backgroundColor = .redBrand
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(messageView)
        self.contentView.addSubview(boxLetterView)
        self.contentView.addSubview(otherBoxLetterView)
        self.backgroundColor = .clear
        self.selectionStyle = .none
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(message: MessageModel, currentUser: UserModel) {
        messageContentLabel.text = message.message
        
        if let firstLetter = message.sender.first {
            labelLetter.text = String(firstLetter).uppercased()
            otherLabelLetter.text = String(firstLetter).uppercased()
        }
        
        if message.sender == currentUser.email {
            messageView.backgroundColor = .pinkPrimaryBrand
            boxLetterView.backgroundColor = .redBrand
            otherBoxLetterView.isHidden = true
        }else {
            messageView.backgroundColor = .redBrand
            otherBoxLetterView.backgroundColor = .pinkPrimaryBrand
            boxLetterView.isHidden = true
        }
        self.otherUserMessageConstraints()
    }
    
    func otherUserMessageConstraints(){
        NSLayoutConstraint.activate([
            self.messageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 54),
            self.messageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -54),
            self.messageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            self.messageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            self.messageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 40),
            
            
            self.messageContentLabel.leadingAnchor.constraint(equalTo: self.messageView.leadingAnchor, constant: 6),
            self.messageContentLabel.trailingAnchor.constraint(equalTo: self.messageView.trailingAnchor, constant: -6),
            self.messageContentLabel.topAnchor.constraint(equalTo: self.messageView.topAnchor, constant: 8),
            self.messageContentLabel.bottomAnchor.constraint(equalTo: self.messageView.bottomAnchor, constant: -8),
            
            self.boxLetterView.heightAnchor.constraint(equalToConstant: 30),
            self.boxLetterView.widthAnchor.constraint(equalToConstant: 30),
            self.boxLetterView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),
            self.boxLetterView.bottomAnchor.constraint(equalTo: self.messageContentLabel.bottomAnchor, constant: 8),

            self.otherBoxLetterView.heightAnchor.constraint(equalToConstant: 30),
            self.otherBoxLetterView.widthAnchor.constraint(equalToConstant: 30),
            self.otherBoxLetterView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12),
            self.otherBoxLetterView.bottomAnchor.constraint(equalTo: self.messageContentLabel.bottomAnchor, constant: 8),

            self.labelLetter.centerXAnchor.constraint(equalTo: self.boxLetterView.centerXAnchor),
            self.labelLetter.centerYAnchor.constraint(equalTo: self.boxLetterView.centerYAnchor),

            self.otherLabelLetter.centerXAnchor.constraint(equalTo: self.otherBoxLetterView.centerXAnchor),
            self.otherLabelLetter.centerYAnchor.constraint(equalTo: self.otherBoxLetterView.centerYAnchor)
         
        ])
    }
}
