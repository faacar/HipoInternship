//
//  HipoImageView.swift
//  HipoInternship
//
//  Created by Ahmet Acar on 1.04.2021.
//

import UIKit

class HipoImageView: UIImageView {
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.borderWidth = 2.0
        layer.borderColor = HipoColors.cellBorderColor?.cgColor
        layer.masksToBounds = true
        layer.cornerRadius = 15.0
        sizeToFit()
    }
}
