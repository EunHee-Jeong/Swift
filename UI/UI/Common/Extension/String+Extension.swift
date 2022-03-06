//
//  String+Extension.swift
//  UI
//
//  Created by 정은희 on 2022/02/04.
//

import UIKit

extension String {
    var isNotEmpty: Bool {
        // 문자를 포함하고 있다면 true 반환
        return !isEmpty
    }
}

extension NSMutableAttributedString {
    public func linked(text: String, url: String) {
        let foundRange = self.mutableString.range(of: text)
        if foundRange.location != NSNotFound {
            self.addAttribute(.link, value: url, range: foundRange)
        }
    }
}
