//
//  ButtonView.swift
//  Hipo
//
//  Created by Ahmet Acar on 27.03.2021.
//

import UIKit
import SnapKit

class ButtonViewController: UIViewController {
    
    let sortMembersButton = UIButton()
    let addNewMemberButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
        configureUI()
        
    }
    
    private func configureButton() {
        view.addSubview(sortMembersButton)
        view.addSubview(addNewMemberButton)
        
        sortMembersButton.setTitle("SORT MEMBERS", for: .normal)
        sortMembersButton.backgroundColor = HipoColors.grayButtonColor
        sortMembersButton.layer.masksToBounds = true
        sortMembersButton.layer.cornerRadius = 25.0
        sortMembersButton.addTarget(self, action: #selector(sortMembersButtonClicked), for: .touchUpInside)
        
        addNewMemberButton.setTitle("ADD NEW MEMBER", for: .normal)
        addNewMemberButton.backgroundColor = HipoColors.greenButtonColor
        addNewMemberButton.layer.masksToBounds = true
        addNewMemberButton.layer.cornerRadius = 25.0
        addNewMemberButton.addTarget(self, action: #selector(addNewMemberButtonClicked), for: .touchUpInside)
        
        if let customFont = UIFont(name: HipoFonts.robotoRegular, size: 16) {
            sortMembersButton.titleLabel!.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: customFont)
            addNewMemberButton.titleLabel!.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: customFont)
        }
    }
    
    private func configureUI() {
        sortMembersButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-26)
            make.height.equalToSuperview().multipliedBy(0.38)

        }
        
        addNewMemberButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-26)
            make.bottom.equalToSuperview().offset(-8)
            make.height.equalToSuperview().multipliedBy(0.38)
        }
    }
    
//MARK: - Button Actions
    
    @objc func sortMembersButtonClicked() {
        //sorting thing
    }
    
    @objc func addNewMemberButtonClicked() {

        let key = UIApplication.shared.windows.first { $0.isKeyWindow }
        var topVC = key!.rootViewController
           while((topVC!.presentedViewController) != nil) {
               topVC = topVC!.presentedViewController
           }
           let customViewController = AddNewMemberViewController()
           let navController = UINavigationController(rootViewController: customViewController)
           topVC?.present(navController, animated: true, completion: nil)
        
    }
    
}
