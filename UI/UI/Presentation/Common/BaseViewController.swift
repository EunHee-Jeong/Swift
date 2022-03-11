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
        hierarchy()
        layout()
    }

    public func style() { }
    public func hierarchy() { }
    public func layout() { }
}
