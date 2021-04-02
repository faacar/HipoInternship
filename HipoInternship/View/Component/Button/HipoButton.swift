//
//  HipoButton.swift
//  HipoInternship
//
//  Created by Ahmet Acar on 28.03.2021.
//

import UIKit

class HipoButton: UIButton {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    private func configure() {
        setTitleColor(.white, for: .normal)
        layer.masksToBounds = true
        layer.cornerRadius = 25.0
        if let customFont = UIFont(name: HipoFonts.robotoRegular, size: 16) {
            titleLabel!.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: customFont)
        }
        
        
        
    }
}
