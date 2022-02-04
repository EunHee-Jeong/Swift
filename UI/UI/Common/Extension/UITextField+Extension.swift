//
//  UITextField+Extension.swift
//  UI
//
//  Created by 정은희 on 2022/02/04.
//

import UIKit

extension UITextField {
    
    public func setLeftPadding(_ size: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: size, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    public func setRightPadding(_ size: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: size, height: self.frame.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
