//
//  ButtonView.swift
//  HipoInternship
//
//  Created by Ahmet Acar on 27.03.2021.
//

import UIKit
import SnapKit

protocol SortButtonDelegate {
    func sortMembers(char: Character)
}

class ButtonViewController: UIViewController {
        
    var hipoModel = [HipoModel]()
    
    private lazy var sortMembersButton = HipoButton(backgroundColor: HipoColors.grayButtonColor!, title: "SORT MEMBERS")
    private lazy var addNewMemberButton = HipoButton(backgroundColor: HipoColors.greenButtonColor!, title: "ADD NEW MEMBER")
    
    var delegate: SortButtonDelegate?
    
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
        delegate?.sortMembers(char: "a")
    }
    
    @objc func addNewMemberButtonClicked() {
        let vc = AddNewMemberViewController()
        let navController = UINavigationController(rootViewController: vc)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true, completion: nil)
    }
    
}
