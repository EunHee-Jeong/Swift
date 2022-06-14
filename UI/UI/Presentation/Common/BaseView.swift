//
//  BaseView.swift
//  UI
//
//  Created by 정은희 on 2022/06/14.
//

import UIKit

class BaseView: UIView, ViewPresentable {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }
    
    // MARK: - Functions
    func setupViews() { }
    func setConstraints() { }
}
