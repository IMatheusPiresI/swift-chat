//
//  InputForm.swift
//  FlashChatViewCode
//
//  Created by Matheus Sousa on 20/07/23.
//

import UIKit

class InputForm: UITextField {
    
    init(placeholderText: String) {
        super.init(frame: .zero)
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = UIFont(name: K.Fonts.PoppinsMedium, size: 14)
        self.textColor = .white
        self.layer.borderWidth = 2
        self.autocorrectionType = .no
        self.layer.borderColor = UIColor.white.cgColor
        self.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        self.layer.cornerRadius = 12
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
