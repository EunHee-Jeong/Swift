//
//  CutstomNavigationBar.swift
//  UI
//
//  Created by 정은희 on 2022/01/06.
//

import UIKit

class CutstomNavigationBar: UIView {

    class func instanceFromNib() -> UIView {
        return UINib(nibName: "CustomNavigationBar", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

}
