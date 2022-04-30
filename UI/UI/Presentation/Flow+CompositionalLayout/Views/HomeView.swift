//
//  HomeView.swift
//  UI
//
//  Created by 정은희 on 2022/03/12.
//

import UIKit

import SnapKit
import Then

final class HomeView: UIView {
    
    // MARK: - Properties
    let homeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        layout.headerReferenceSize = CGSize(width: 355, height: 35)
        $0.collectionViewLayout = layout
        $0.register(ContentCollectionViewCell.self, forCellWithReuseIdentifier: ContentCollectionViewCell.identifier)
        $0.register(ContentHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ContentHeaderView.identifier)
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

    // MARK: - Functions
    private func setUI() {
        addSubview(homeCollectionView)
    }
    
    private func setConstraint() {
        homeCollectionView.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.edges.equalTo(safeAreaLayoutGuide)
        }
    }
}
