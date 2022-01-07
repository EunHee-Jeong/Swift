//
//  SnapKitVC.swift
//  UI
//
//  Created by 정은희 on 2022/01/06.
//

import UIKit

import SnapKit

class SnapKitVC: UIViewController {
    
    // MARK: - Vars & Lets Part
    let customTextView = UITextView()
    let changeButton = UIButton()
    
    let fonts = ["kefa", "papyrus", "zapfino", "bradleyHand"]

    // MARK: - Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Custom Method Part
    func setUI() {
        view.backgroundColor = .white
        navigationItem.title = "Custom Font"
        
        view.addSubview(customTextView)
        view.addSubview(changeButton)
        
        setCustomTextView(customTextView)
        setChangeButton(changeButton)
        
        customTextView.delegate = self
    }
    
    func setCustomTextView(_ textView: UITextView) {
        
        textView.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.centerX.equalTo(view.center)
            make.centerY.equalTo(view.center)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-50)
            
        }
    }
    
    func setChangeButton(_ button: UIButton) {
        
        button.snp.makeConstraints { make in
            make.centerX.equalTo(view.center)
            make.height.equalTo(50)
            make.top.equalTo(customTextView).offset(50)
        }
    }
    
    // MARK: - @objc Function Part
    @objc
    func changeButtonTapped(sender: UIButton) {
        if let font = fonts.randomElement() {
            customTextView.font = UIFont.init(name: font, size: 25)
        }
    }
}

// MARK: - Extension Part
extension UIViewController: UITextViewDelegate {
    
    private func textViewDidChange2(_ textView: UITextView) {
        let size = CGSize(width: textView.frame.width, height: .infinity)
        let estimateSize = textView.sizeThatFits(size)
        textView.constraints.forEach { constraint in
            if constraint.firstAttribute == .height {
                constraint.constant = estimateSize.height
            }
        }
    }
}
