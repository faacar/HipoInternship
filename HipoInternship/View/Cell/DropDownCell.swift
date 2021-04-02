//
//  DropDownCell.swift
//  HipoInternship
//
//  Created by Ahmet Acar on 28.03.2021.
//

import UIKit
import DropDown

class CustomDropDownCell: DropDownCell {
    
    @IBOutlet var positionImageView: UIImageView!
    static let cellID = "DropDownCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        positionImageView.contentMode = .scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
