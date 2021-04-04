//
//  MembersCell.swift
//  HipoInternship
//
//  Created by Ahmet Acar on 27.03.2021.
//

import UIKit
import SnapKit

class MembersCell: UITableViewCell {
    
    static let cellId = "membersCellId"
    let membersNameLabel = HipoLabel(fontSize: 17)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(membersNameLabel)
        layer.masksToBounds = true
        layer.cornerRadius = 20.0
        backgroundColor = HipoColors.cellBackgroundColor
        layer.borderWidth = 2.0
        layer.borderColor = HipoColors.cellBorderColor?.cgColor
        selectionStyle = .none
        
        let sentImage = UIImage(systemName: "arrow.forward")
        let sentImageView = UIImageView(image: sentImage)
        sentImageView.tintColor = HipoColors.cellArrow
        
        accessoryView = sentImageView
        
        membersNameLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(14)
            make.right.equalToSuperview().offset(-150)
        }
    }
}
