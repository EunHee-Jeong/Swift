//
//  ContentCollectionViewCell.swift
//  UI
//
//  Created by 정은희 on 2022/03/12.
//

import UIKit

import SnapKit
import Then

final class ContentCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setConstraint()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 셀의 레이아웃은 self가 아닌 기본 contentView라는 객체에 적용해야 함.
        // contentView == superView
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
    }
    
    // MARK: - Functions
    private func setUI() {
        contentView.addSubview(imageView)
    }
    
    private func setConstraint() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
