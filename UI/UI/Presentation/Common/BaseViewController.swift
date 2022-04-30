//
//  BaseViewController.swift
//  UI
//
//  Created by 정은희 on 2022/02/04.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setHierarchy()
        setNavigation()
        setTargets()
        setStyle()
    }

    // MARK: - Functions
    func setHierarchy() { }
    func setNavigation() { }
    func setTargets() { }
    func setStyle() { }
}
