//
//  ViewController.swift
//  UI
//
//  Created by 정은희 on 2022/01/04.
//

import UIKit

class NSConstraintVC: UIViewController {
    
    // MARK: - Vars & Lets Part
    let customTextView: UITextView = {
        let textView: UITextView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor.black.cgColor
        textView.textAlignment = .center
        
        return textView
    }()
    
    let changeButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Change Font", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.white, for: .highlighted)
        button.addTarget(self, action: #selector(changeButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    let fonts = ["kefa", "papyrus", "zapfino", "bradleyHand"]

    // MARK: - Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
//        setCustomNavigationBar()
        setUI()
    }

    // MARK: - Custom Method Part
//    func setCustomNavigationBar() {
//        let customNavibar = CustomNavigationBar.instanceFromNib()
//        customNavibar.frame = self.view.frame
//        self.view.addSubview(customNavibar)
//    }
    
    func setUI() {
        navigationItem.title = "Custom Font"
        view.backgroundColor = .white
        
        view.addSubview(customTextView)
        view.addSubview(changeButton)
        
        setCustomTextView(customTextView)
        setChangeButton(changeButton)
        
        customTextView.delegate = self
    }
    
    func setCustomTextView(_ textView: UITextView) {
        
        NSLayoutConstraint.activate([
            textView.widthAnchor.constraint(equalToConstant: 100),
            textView.heightAnchor.constraint(equalToConstant: 100),
            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 50),
            textView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -50)
        ])
    }
    
    func setChangeButton(_ button: UIButton) {
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.topAnchor.constraint(equalTo: customTextView.bottomAnchor, constant: 50)
        ])
    }
    
    @objc func changeButtonTapped(sender: UIButton) {
        if let font = fonts.randomElement() {
            customTextView.font = UIFont.init(name: font, size: 25)
        }
    }
}

// MARK: - Extension Part
extension UIViewController: UITextViewDelegate {
    
    public func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: textView.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        textView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = estimatedSize.height
            }
        }
    }
}
