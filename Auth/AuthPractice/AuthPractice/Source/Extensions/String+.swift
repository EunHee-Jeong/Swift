//
//  String+.swift
//  AuthPractice
//
//  Created by 정은희 on 2022/04/18.
//

import Foundation

let emailPattern = "[A-Za-z0-9._%+-]+@[A-Za-z0-9._+-]+\\.[A-Za-z]{2,64}"
let passwordPattern = "[A-Z0-9a-z!@#$%^&*()_+=-]{8,16}"

extension String {
    public func isEmail() -> Bool {
        let emailValidate = NSPredicate(format: "SELF MATCHES %@", emailPattern)
        return emailValidate.evaluate(with: self)
    }
    public func isPassword() -> Bool {
        let passwordValidate = NSPredicate(format: "SELF MATCHES %@", passwordPattern)
        return passwordValidate.evaluate(with: self)
    }
}
