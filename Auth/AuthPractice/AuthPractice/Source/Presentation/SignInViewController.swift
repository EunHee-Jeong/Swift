//
//  SignInViewController.swift
//  AuthPractice
//
//  Created by 정은희 on 2022/04/15.
//

import UIKit

final class SignInViewController: BaseViewController {
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailWarningLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordWarningLabel: UILabel!
    @IBOutlet weak var checkTextField: UITextField!
    @IBOutlet weak var checkWarningLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Functions
    override func style() {
        super.style()
        
        [emailTextField, passwordTextField, checkTextField].forEach {
            $0?.font = .systemFont(ofSize: 18)
            $0?.setLeftPadding(amount: 10)
        }
        nextButton.layer.cornerRadius = 12
    }
    
    override func addTarget() {
        super.addTarget()
        
        [emailTextField, passwordTextField, checkTextField].forEach {
            $0?.addTarget(self, action: #selector(checkValidate), for: .editingChanged)
        }
        [emailTextField, passwordTextField, checkTextField].forEach {
            $0?.addTarget(self, action: #selector(setButton), for: .editingChanged)
        }
    }
    
    @objc
    private func checkValidate() {
        if emailTextField.hasText && (emailTextField.text?.isEmail() == false) {
            emailWarningLabel.isHidden = false
        } else { emailWarningLabel.isHidden = true }
        
        if passwordTextField.hasText && (passwordTextField.text?.isPassword() == false) {
            passwordWarningLabel.isHidden = false
        } else { passwordWarningLabel.isHidden = true }
        
        if checkTextField.hasText && (checkTextField.text != passwordTextField.text) {
            checkWarningLabel.isHidden = false
        } else { checkWarningLabel.isHidden = true }
    }
    
    @objc
    private func setButton() {
        nextButton.isEnabled = [emailTextField, passwordTextField, checkTextField].allSatisfy { $0.hasText }
        if nextButton.isEnabled && checkTextField.text == passwordTextField.text {
            nextButton.backgroundColor = UIColor.systemBlue
        }
    }
}
