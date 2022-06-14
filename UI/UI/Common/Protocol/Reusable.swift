//
//  Reusable.swift
//  UI
//
//  Created by 정은희 on 2022/06/14.
//

import Foundation

protocol Reusable: AnyObject {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
