//
//  SnapKitPracticeVC.swift
//  UI
//
//  Created by 정은희 on 2022/01/06.
//

import UIKit

import SnapKit

class SnapKitPracticeVC: UIViewController {
    
    // MARK: - Vars & Lets Part
    let nameLabel = UILabel()
    let nameTextField = UITextField()
    let changeButton = UIButton()

    // MARK: - Lifr Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpValue()
        setUpView()
        setConstraints()
    }
    
    // MARK: - Custom Method Part
    
    // 값 설정
    func setUpValue() {
        view.backgroundColor = .white
        nameLabel.text = "Label"
        nameTextField.backgroundColor = .gray
        changeButton.backgroundColor = .blue
    }
    
    // 뷰 구성요소 세팅
    func setUpView() {
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(changeButton)
    }
    
    // 제약 설정
    func setConstraints() {
        changeButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(24)
            make.leading.trailing.equalTo(nameLabel)
        }
    }
    
}
