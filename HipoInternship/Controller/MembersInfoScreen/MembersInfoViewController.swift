//
//  MembersInfoViewController.swift
//  HipoInternship
//
//  Created by Ahmet Acar on 1.04.2021.
//

import UIKit
import SnapKit

class MembersInfoViewController: UIViewController {
    
    var membersInfo: Members!
    var imageURL: String = ""
    let githubAvatarImageView = HipoImageView()

    private lazy var memberNameStackView = HipoStackView(leftLabel: "Name", rightLabel: membersInfo.name)
    private lazy var memberAgeStackView = HipoStackView(leftLabel: "Age", rightLabel: String(membersInfo.age))
    private lazy var memberLocationStackView = HipoStackView(leftLabel: "Location", rightLabel: membersInfo.location)
    private lazy var memberGithubNameStackView = HipoStackView(leftLabel: "Github", rightLabel: "@\(membersInfo.github)")
    private lazy var memberPositionStackView = HipoStackView(leftLabel: "Position", rightLabel: membersInfo.hipo.position)
    private lazy var memberYearsInHipoStackView = HipoStackView(leftLabel: "Years in Hipo", rightLabel: String(membersInfo.hipo.yearsInHipo))
    private lazy var stackView = UIStackView(arrangedSubviews: [memberNameStackView, memberAgeStackView, memberLocationStackView,
                                                                memberGithubNameStackView, memberPositionStackView, memberYearsInHipoStackView])

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        
        configureNavigationController()
        setAvatarImageView()
        configureAvatarImageView()
        configureStackView()
    }
    
    private func setAvatarImageView() {
        NetworkManager().getAvatarURL(githubUserName: membersInfo.github) { (result) in
            switch result {
            case .success(let url):
                DispatchQueue.main.async {
                    self.imageURL = url
                    self.githubAvatarImageView.load(stringURL: self.imageURL)
                }
            case .failure( _):
                self.presentAlert(title: "test", message: "\(HipoError.unexpectedError)")
            }
        }
    }

    private func configureAvatarImageView() {
        view.addSubview(githubAvatarImageView)
        
        githubAvatarImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(70)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.right.equalToSuperview().offset(-70)
            make.bottom.equalToSuperview().multipliedBy(0.36)
        }
    }
    
    private func configureStackView() {
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10

        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(githubAvatarImageView.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.height.equalToSuperview().multipliedBy(0.48)
        }
    }
    
    private func configureNavigationController() {
        navigationController?.navigationBar.tintColor = HipoColors.greenButtonColor
        title = membersInfo.github
        let shareButton = UIBarButtonItem(image: UIImage(systemName: HipoImages.shareImage), style: .plain, target: self, action: #selector(shareButtonTapped))
        shareButton.tintColor = HipoColors.greenButtonColor
        
        navigationItem.rightBarButtonItem = shareButton
        
    }
    
    @objc func shareButtonTapped() {
        let text = membersInfo.name
        let image = githubAvatarImageView.image
        let myWebsite = NSURL(string:"https://api.github.com/users/\(membersInfo.github)")
        let shareAll = [text , image! , myWebsite!] as [Any]
        let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
}
