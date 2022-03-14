//
//  BaseViewController.swift
//  UI
//
//  Created by 정은희 on 2022/02/04.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        style()
        setNavigation()
        hierarchy()
        layout()
    }

    public func style() { }
    public func setNavigation(backgroundColor: UIColor = .clear) {
        guard let navigationBar = navigationController?.navigationBar else { return }
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = backgroundColor
        
        guard let navigationController = navigationController else { return }
        navigationController.hidesBarsOnSwipe = true
    }
    public func hierarchy() { }
    public func layout() { }
}
