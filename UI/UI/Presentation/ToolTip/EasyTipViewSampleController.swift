//
//  EasyTipViewSampleViewController.swift
//  UI
//
//  Created by 정은희 on 2022/04/30.
//

import UIKit

import EasyTipView

final class EasyTipViewSampleViewController: BaseViewController {
    
    // MARK: - Properties
    private let easyTipSampleView = EasyTipSampleView()

    // MARK: - View Life Cycle
    override func loadView() {
        view = easyTipSampleView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentToolTip()
    }
}

extension EasyTipViewSampleViewController {
    private func presentToolTip() {
        var preferences = EasyTipView.Preferences()
        preferences.drawing.font = UIFont(name: "Futura-Medium", size: 14)!
        preferences.drawing.foregroundColor = .white
        preferences.drawing.backgroundColor = .black
        preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.top
        
        let tipView = EasyTipView(text: "친구가 보낸 약 알림 일정을 확인해보세요", preferences: preferences)
        tipView.show(animated: true,
                     forView: easyTipSampleView.detailStack,
                     withinSuperview: self.easyTipSampleView)
        
        // asyncAfter → 일정 시간 이후 진행할 작업에 사용
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(4)) {
            tipView.dismiss()
        }
    }
}
