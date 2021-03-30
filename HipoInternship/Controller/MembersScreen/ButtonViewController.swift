//
//  ButtonView.swift
//  Hipo
//
//  Created by Ahmet Acar on 27.03.2021.
//

import UIKit
import SnapKit

class ButtonViewController: UIViewController {
    
    private lazy var sortMembersButton = HipoButton(backgroundColor: HipoColors.grayButtonColor, title: "SORT MEMBERS")
    private lazy var addNewMemberButton = HipoButton(backgroundColor: HipoColors.greenButtonColor, title: "ADD NEW MEMBER")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
        configureUI()
        
    }
    
    private func configureButton() {
        view.addSubview(sortMembersButton)
        view.addSubview(addNewMemberButton)
        
        sortMembersButton.addTarget(self, action: #selector(sortMembersButtonClicked), for: .touchUpInside)
        addNewMemberButton.addTarget(self, action: #selector(addNewMemberButtonClicked), for: .touchUpInside)
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
        print(PersistenceManager.load())
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
