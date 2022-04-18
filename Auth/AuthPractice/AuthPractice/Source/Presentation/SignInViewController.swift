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
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func style() {
        super.style()
        
        [emailTextField, passwordTextField, checkTextField].forEach {
            $0?.font = .systemFont(ofSize: 18)
            $0?.setLeftPadding(amount: 10)
        }
        nextButton.layer.cornerRadius = 12
    }
}
