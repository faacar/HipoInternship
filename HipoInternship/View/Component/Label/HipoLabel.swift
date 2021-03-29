//
//  HipoLabel.swift
//  HipoAssignmet
//
//  Created by Ahmet Acar on 27.03.2021.
//

import UIKit

class HipoLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(fontSize: CGFloat) {
        super.init(frame: .zero)
        if let customFont = UIFont(name: HipoFonts.robotoMedium, size: fontSize) {
            self.font = UIFontMetrics(forTextStyle: .title1).scaledFont(for: customFont)
        }
        configure()
    }
    
    private func configure() {
        text = "Test text"
        textColor = .label
        numberOfLines = 0
        textAlignment = .left
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
    }
}
