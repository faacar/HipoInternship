//
//  AddNewMemberViewController.swift
//  HipoInternship
//
//  Created by Ahmet Acar on 28.03.2021.
//

import UIKit
import DropDown
import SnapKit

class AddNewMemberViewController: UIViewController {
    
    let dropDown = DropDown()
    let dropDownView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigation()
        configureDropDownView()
        configureDropDown()
        DropDown.appearance().cornerRadius = 10

    }
    
    private func configureDropDownView() {
        view.addSubview(dropDownView)
        dropDownView.backgroundColor = .systemTeal
        
        dropDownView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(100)
        }
    }
    
    private func configureNavigation() {
        view.backgroundColor = .systemPink
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(disissVCButtonClicked))
        navigationItem.rightBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem?.tintColor = HipoColors.grayButtonColor
        navigationItem.title = "Add New Member"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: HipoFonts.robotoMedium, size: 16)!]
    }
    
    private func configureDropDown() {
        dropDown.dataSource = [ "iOS",
                                "Android"]
        
        dropDown.cellNib = UINib(nibName: "DropDownCell", bundle: nil)
    
        dropDown.customCellConfiguration = { index, title, cell in
            guard let cell = cell as? CustomDropDownCell else { return }
            let appleLogo = UIImage(systemName: HipoImages.appleLogo)?.withTintColor(HipoColors.appleLogoColor, renderingMode: .alwaysOriginal)
            let androidLogo = UIImage(named: HipoImages.androidLogo)
            cell.positionImageView.image = index == 0 ? appleLogo : androidLogo
        }

        dropDown.anchorView = dropDownView

        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapTopItem))
        gesture.numberOfTouchesRequired = 1
        gesture.numberOfTapsRequired = 1
        dropDownView.addGestureRecognizer(gesture)
        
        dropDown.selectionAction = { index, title in
            print("index:\(index), title: \(title)")
        }
    }
    
    
    @objc func disissVCButtonClicked() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapTopItem() {
        dropDown.show()
    }
    
}
