//
//  RoundButton.swift
//  UI
//
//  Created by 정은희 on 2022/02/05.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    @IBInspectable
    var isRound: Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }
    
}
