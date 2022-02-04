//
//  ViewController.swift
//  CodeBaseAutoLayout
//
//  Created by 정은희 on 2022/02/04.
//

import UIKit

import SnapKit

final class ViewController: BaseViewController {
    
    // MARK: - Properties
    private var redButton: UIButton = UIButton()
    private var blueButton: UIButton = UIButton()
    private var greenButton: UIButton = UIButton()
    private var pinkButton: UIButton = UIButton()
    private var resultLabel: UILabel = UILabel()

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }

    // MARK: - Functions
    override func layout() {
        
        [redButton, blueButton, greenButton, pinkButton].forEach {
            view.addSubview($0)
        }
        view.addSubview(resultLabel)
        
        redButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(44)
        }
        
        blueButton.snp.makeConstraints { make in
            // top, leading 은 + 값을 줘야 벌어지고,
            // bottom, trailing은 - 값을 줘야 벌어진다.
            make.top.equalTo(redButton.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(44)
        }
        
        greenButton.snp.makeConstraints { make in
            make.top.equalTo(blueButton.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(44)
        }
        
        pinkButton.snp.makeConstraints { make in
            make.top.equalTo(greenButton.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(44)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-80)
        }
        
        [redButton, blueButton, greenButton, pinkButton].forEach {
            $0.addTarget(self, action: #selector(onClickButton(_:)), for: .touchUpInside)
        }
    }
    
    override func style() {
        [redButton, blueButton, greenButton, pinkButton].forEach {
            $0.setTitleColor(.white, for: .normal)
        }
        redButton.backgroundColor = .systemRed
        redButton.setTitle("Red Button", for: .normal)
        blueButton.backgroundColor = .systemBlue
        blueButton.setTitle("Blue Button", for: .normal)
        greenButton.backgroundColor = .systemGreen
        greenButton.setTitle("Green Button", for: .normal)
        pinkButton.backgroundColor = .systemPink
        pinkButton.setTitle("Pink Button", for: .normal)
        resultLabel.font = .systemFont(ofSize: 24, weight: .bold)
        resultLabel.textAlignment = .center
        resultLabel.text = "버튼을 클릭하세요"
    }
    
    @objc
    func onClickButton(_ sender: UIButton) {
        switch sender {
        case redButton:
            resultLabel.text = "Red Button Clicked."
        case blueButton:
            resultLabel.text = "Blue Button Clicked."
        case greenButton:
            resultLabel.text = "Green Button Clicked."
        case pinkButton:
            resultLabel.text = "Pink Button Clicked."
        default:
            break
        }
    }
}

