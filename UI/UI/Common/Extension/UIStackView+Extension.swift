//
//  UIStackView+Extension.swift
//  UI
//
//  Created by 정은희 on 2022/02/04.
//

import UIKit

extension UIStackView {
    // addArrangeSubview(_:) 정리하는 코드
    public func addArrangedSubviews(_ views: UIView...) {
        views.forEach(addArrangedSubview(_:))
    }
}
