//
//  MemberViewController.swift
//  Hipo
//
//  Created by Ahmet Acar on 27.03.2021.
//

import UIKit
import SnapKit

class MembersViewController: UIViewController {
    
    var tableView = UITableView()
    let buttonViewController = ButtonViewController()
    let hipoData = DataLoader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        addChildVC()
        configureNavigationController()
        configureTableView()
        configureUI()
    }

    private func addChildVC() {
        addChild(buttonViewController)
        view.addSubview(buttonViewController.view)
        buttonViewController.didMove(toParent: self)
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MembersCell.self, forCellReuseIdentifier: MembersCell.cellId)
        
        tableView.rowHeight = 65
        tableView.separatorStyle = .none

    }
    
    private func configureNavigationController() {
        title = "Members"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: HipoFonts.robotoMedium, size: 20)!]
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = UIColor.clear
    }
    
    private func configureUI() {
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.height.equalToSuperview().multipliedBy(0.67)
        }
        
        buttonViewController.view.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.height.equalToSuperview().multipliedBy(0.18)
        }

    }
}

//MARK: - Extension UITableViewDelegate, UITableViewDataSource

extension MembersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return hipoData.hipoModel.members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MembersCell.cellId) as! MembersCell
        cell.membersNameLabel.text = hipoData.hipoModel.members[indexPath.section].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    
}
