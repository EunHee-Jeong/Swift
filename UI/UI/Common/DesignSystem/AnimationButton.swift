//
//  UIButton+Extension.swift
//  UI
//
//  Created by 정은희 on 2022/03/06.
//

import UIKit

public protocol AnimationButtonDelegate: AnyObject {
    func didChangeHighlighted(highlighted: Bool)
}

class AnimationButton: UIButton {
    weak var delegate: AnimationButtonDelegate?
    override var isHighlighted: Bool {
        // ✅ isHighlighted 상태 확인
        didSet {
            self.delegate?.didChangeHighlighted(highlighted: self.isHighlighted)
        }
    }
}
