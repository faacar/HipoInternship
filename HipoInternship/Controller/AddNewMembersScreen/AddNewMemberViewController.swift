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
    lazy var stackView = UIStackView()
    var hipoModel: HipoModel!
    var teamName: String!

    private lazy var nameTextField = HipoTextField(pHolder: "Name", imageName: HipoImages.nameImage)
    private lazy var ageTextField = HipoTextField(pHolder: "Age", imageName: HipoImages.ageImage)
    private lazy var locationTextField = HipoTextField(pHolder: "Location", imageName: HipoImages.locationImage)
    private lazy var githubTextField = HipoTextField(pHolder: "Github", imageName: HipoImages.githubImage)
    private lazy var positionTextField = HipoTextField(pHolder: "Position", imageName: HipoImages.positionImage)
    private lazy var yearsInHipoTextField = HipoTextField(pHolder: "Years in Hipo", imageName: HipoImages.yearsInHipo)
    private lazy var teamLabel = HipoLabel(fontSize: 17)
    private lazy var saveButton = HipoButton(backgroundColor: HipoColors.greenButtonColor, title: "Save")
        
    override func viewDidLoad() {
        super.viewDidLoad()

        teamLabel.configureTeamLabel(imageName: HipoImages.teamImage, text: "Select Team", hipoLabel: &teamLabel)

        configureNavigation()
        configureStackView()
        configureDropDownView()
        configureDropDown()
        cofigureSaveButton()
        configureTextFields()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        teamLabel.configureTeamLabel(imageName: HipoImages.teamImage, text: "Select Team", hipoLabel: &teamLabel)
    }
    
    private func configureNavigation() {
        view.backgroundColor = .systemBackground
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(disissVCButtonClicked))
        navigationItem.rightBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem?.tintColor = HipoColors.grayButtonColor
        navigationItem.title = "Add New Member"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: HipoFonts.robotoMedium, size: 16)!]
    }
    
    private func configureStackView() {
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(ageTextField)
        stackView.addArrangedSubview(locationTextField)
        stackView.addArrangedSubview(githubTextField)
        stackView.addArrangedSubview(positionTextField)
        stackView.addArrangedSubview(yearsInHipoTextField)
        stackView.addArrangedSubview(dropDownView)
        
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalToSuperview().multipliedBy(0.50)
        }

    }
    
    private func configureTextFields() {
        nameTextField.delegate = self
        nameTextField.tag = 1
        nameTextField.becomeFirstResponder() //
        
        ageTextField.delegate = self
        ageTextField.keyboardType = .numbersAndPunctuation

        ageTextField.tag = 2
        
        locationTextField.delegate = self
        locationTextField.tag = 3
        
        githubTextField.delegate = self
        githubTextField.tag = 4
        
        positionTextField.delegate = self
        positionTextField.tag = 5
        
        yearsInHipoTextField.delegate = self
        yearsInHipoTextField.keyboardType = .numbersAndPunctuation
        yearsInHipoTextField.tag = 6

    }
    
    private func cofigureSaveButton() {
        view.addSubview(saveButton)
        saveButton.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
        saveButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-26)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(dropDownView).multipliedBy(1.3)
        }

    }
    
// MARK: - DropDown configurations
    
    private func configureDropDownView() {
        dropDownView.addSubview(teamLabel)
        dropDownView.backgroundColor = HipoColors.cellBackgroundColor
        dropDownView.layer.masksToBounds = true
        dropDownView.layer.cornerRadius = 20.0
        dropDownView.layer.borderWidth = 3.0
        dropDownView.layer.borderColor = HipoColors.cellBorderColor.cgColor
        
        teamLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    private func configureDropDown() {
        dropDown.dataSource = [ "iOS", "Android"]
        
        dropDown.cellNib = UINib(nibName: "DropDownCell", bundle: nil)
        DropDown.appearance().cornerRadius = 20.0

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
        
        dropDown.selectionAction = { [self] index, title in
            print("index:\(index), title: \(title)")
            if index == 0 { // ios
                teamLabel.configureTeamLabel(imageName: HipoImages.appleLogo, text: "iOS Team", hipoLabel: &teamLabel)
                
                self.teamName = "iOS Team"
            } else {
                teamLabel.configureTeamLabel(imageName: HipoImages.androidLogo, text: "Android Team", hipoLabel: &teamLabel)
                
                self.teamName = "Android Team"
            }
        }
    }

// MARK: - Buttons action
    
    @objc func disissVCButtonClicked() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapTopItem() {
        dropDown.show()
    }
    
    @objc func saveButtonClicked() {
        if nameTextField.text == "" || ageTextField.text == "" || locationTextField.text == "" || githubTextField.text == "" || positionTextField.text == "" || yearsInHipoTextField.text == "" || teamName == "" { // team name bug
            let alertController = UIAlertController(title: "Missing Place", message: "We can't proceed because one of the fields is blank. Please note that all fields are required.", preferredStyle: .alert)
            let okeyAction = UIAlertAction(title: "Okey", style: .default, handler: nil)
            
            alertController.addAction(okeyAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        saveData()
    }
    
    private func saveData() {
        let hipoInfo = HipoInfo(position: positionTextField.text!, yearsInHipo: Int(yearsInHipoTextField.text!) ?? 0)
        let newMember = Members(name: nameTextField.text!,
                            age: Int(ageTextField.text!) ?? 0,
                            location: locationTextField.text!,
                            github: githubTextField.text!,
                            hipo: hipoInfo)
        hipoModel = HipoModel(company: "Hipo", team: teamName, members: [newMember])
        print(hipoModel)
    }
    
}

//MARK: - Extension UITextFieldDelegate

extension AddNewMemberViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextTextField = view.viewWithTag(textField.tag + 1) {
            textField.resignFirstResponder()
            nextTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
