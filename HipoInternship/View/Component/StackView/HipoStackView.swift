//
//  HipoStackView.swift
//  HipoInternship
//
//  Created by Ahmet Acar on 2.04.2021.
//

import UIKit
import SnapKit

class HipoStackView: UIStackView {
    
    private lazy var titleLabel = HipoLabel(fontSize: 16)
    private lazy var descriptionLabel = HipoLabel(fontSize: 16)
    
    init(leftLabel: String, rightLabel: String) {
        super.init(frame: .zero)
        titleLabel.text = leftLabel
        descriptionLabel.text = ":  \(rightLabel)"
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addArrangedSubview(titleLabel)
        addArrangedSubview(descriptionLabel)
        backgroundColor = HipoColors.cellBackgroundColor
        titleLabel.backgroundColor = HipoColors.cellBackgroundColor //
        axis = .horizontal
        distribution = .fill
        layer.borderWidth = 3.0
        layer.borderColor = HipoColors.cellBorderColor?.cgColor
        layer.masksToBounds = true
        layer.cornerRadius = 20.0
        
        titleLabel.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.32)
            make.left.equalToSuperview().offset(8)
        }
        descriptionLabel.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.68)
            make.right.equalToSuperview().offset(-8)
        }
    }
}
