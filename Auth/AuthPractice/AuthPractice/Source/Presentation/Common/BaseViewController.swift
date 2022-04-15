//
//  BaseViewController.swift
//  AuthPractice
//
//  Created by 정은희 on 2022/04/15.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        hierarchy()
        navigation()
        layout()
        style()
    }
    
    public func hierarchy() { }
    public func navigation(backgroundColor: UIColor = .clear) {
            guard let navigationBar = navigationController?.navigationBar else { return }
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
            
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = backgroundColor
            
            guard let navigationController = navigationController else { return }
            navigationController.hidesBarsOnSwipe = true
        }
    public func layout() { }
    public func style() { }
}
