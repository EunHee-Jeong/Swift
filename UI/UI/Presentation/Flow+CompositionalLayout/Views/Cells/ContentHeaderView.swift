//
//  ContentHeaderView.swift
//  UI
//
//  Created by 정은희 on 2022/03/12.
//

import UIKit

import SnapKit
import Then

final class ContentHeaderView: UICollectionReusableView {
    let sectionNameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 17, weight: .bold)
        $0.textColor = .white
        $0.sizeToFit()
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setConstraint()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Functions
    private func setUI() {
        addSubview(sectionNameLabel)
    }
    
    private func setConstraint() {
        sectionNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.top.bottom.leading.equalToSuperview().offset(10)
        }
    }
}
