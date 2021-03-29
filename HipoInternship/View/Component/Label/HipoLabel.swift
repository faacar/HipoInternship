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
    
    let test = NSTextAttachment()
    
}

extension HipoLabel {
    func configureTeamLabel(imageName: String, text: String, hipoLabel: inout HipoLabel) {
        let imageAttachment = NSTextAttachment()
        //let hipoLabel = hipoLabel
        imageAttachment.image = UIImage(named: imageName) ?? UIImage(systemName: imageName)
        
        imageAttachment.bounds = CGRect(x: 0, y: -3, width: imageAttachment.image!.size.width, height: imageAttachment.image!.size.height)
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        
        let completeText = NSMutableAttributedString(string: " ")
        completeText.append(attachmentString)
        
        let textAfterIcon = NSAttributedString(string: "  \(text)")
        
        completeText.append(textAfterIcon)
        
        hipoLabel.textAlignment = .left
        hipoLabel.attributedText = completeText
        hipoLabel.backgroundColor = HipoColors.cellBackgroundColor
        
    }
}
