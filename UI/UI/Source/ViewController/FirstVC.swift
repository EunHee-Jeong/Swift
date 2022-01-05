//
//  ViewController.swift
//  UI
//
//  Created by 정은희 on 2022/01/04.
//

import UIKit

class FirstVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomNavigationBar()
    }

    func setCustomNavigationBar() {
        let customNavibar = CustomNavigationBar.instanceFromNib()
        customNavibar.frame = self.view.frame
        self.view.addSubview(customNavibar)
    }
}

