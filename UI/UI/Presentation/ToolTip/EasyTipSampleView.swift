//
//  EasyTipSampleView.swift
//  UI
//
//  Created by 정은희 on 2022/04/30.
//

import UIKit

import EasyTipView
import SnapKit
import Then

final class EasyTipSampleView: UIView, ViewPresentable {

    // MARK: - Properties
    private let detailLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.text = "상세보기"
    }
    private let detailButton = UIButton().then {
        $0.contentMode = .scaleAspectFit
        $0.setImage(UIImage(named: "Vector"), for: .normal)
    }
    let detailStack = UIStackView().then {
        $0.alignment = .fill
        $0.axis = .horizontal
        $0.spacing = 4
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Functions
    func setUI() {
        detailStack.addArrangedSubviews(detailLabel, detailButton)
        addSubview(detailStack)
    }
    
    func setConstraints() {
        detailButton.snp.makeConstraints { make in
            make.width.equalTo(16)
            make.height.equalTo(detailButton.snp.width)
        }
        detailStack.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
    }
}
