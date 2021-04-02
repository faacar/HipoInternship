//
//  HipoTextField.swift
//  HipoInternship
//
//  Created by Ahmet Acar on 28.03.2021.
//

import UIKit

class HipoTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0)

    init(pHolder: String, imageName: String) {
        super.init(frame: .zero)
        configure(pHolder, imageName)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(_ pHolder: String, _ leftImageName: String) {
        let padding = 8
        let size = 20
        
        placeholder = pHolder
        
        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size+padding, height: size) )
        let leftImage = UIImage(named: leftImageName) ?? UIImage(systemName: leftImageName)
        let leftImageView = UIImageView(frame: CGRect(x: padding, y: 0, width: size, height: size))
        leftImageView.tintColor = .black
        leftImageView.image = leftImage
        outerView.addSubview(leftImageView)

        leftView = outerView
        leftViewMode = .always

        leftImageView.contentMode = .left
        layer.masksToBounds = true
        layer.cornerRadius = 20.0
        backgroundColor = HipoColors.cellBackgroundColor
        layer.borderWidth = 3.0
        layer.borderColor = HipoColors.cellBorderColor?.cgColor
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

}
