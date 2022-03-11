//
//  AnimationButton.swift
//  UI
//
//  Created by 정은희 on 2022/03/06.
//

import UIKit

class AnimationButton: UIButton {
  private enum Animation {
    typealias Element = (
      duration: TimeInterval,
      delay: TimeInterval,
      options: UIView.AnimationOptions,
      scale: CGAffineTransform,
      alpha: CGFloat
    )
    
    case touchDown
    case touchUp
    
    var element: Element {
      switch self {
      case .touchDown:
        return Element(
          duration: 1,
          delay: 0,
          options: .curveEaseIn,
          scale: .init(scaleX: 1.1, y: 1.1),
          alpha: 0.8
        )
      case .touchUp:
        return Element(
          duration: 0,
          delay: 0,
          options: .curveLinear,
          scale: .identity,
          alpha: 1
        )
      }
    }
  }
  
  override var isHighlighted: Bool {
    // ✅ isHighlighted 상태 확인
    didSet {
        self.animateWhenHighlighted()
    }
  }

  private func animateWhenHighlighted() {
    let animationElement = self.isHighlighted ? Animation.touchDown.element : Animation.touchUp.element
    
    UIView.animate(
        withDuration: animationElement.duration,
        delay: animationElement.delay,
        options: animationElement.options,
        animations: {
            self.transform = animationElement.scale
            self.alpha = animationElement.alpha
        }
    )
  }
}
