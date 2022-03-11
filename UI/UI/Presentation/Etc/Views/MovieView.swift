//
//  MovieView.swift
//  UI
//
//  Created by 정은희 on 2022/03/06.
//

import UIKit

import SnapKit
import Then

final class MovieView: UIView {

    // MARK: - Properties
    private let titleLabel = UITextView().then {
        let attributedString = NSMutableAttributedString(string: "[ 명탐정 코난: 비색의 탄환 ]")
        attributedString.linked(text: "명탐정 코난: 비색의 탄환", url: "https://movie.naver.com/movie/bi/mi/basic.naver?code=203097")
        $0.attributedText = attributedString
        $0.dataDetectorTypes = .link
        $0.font = .systemFont(ofSize: 30)
        $0.isEditable = false
    }
    private let contentButton = AnimationButton().then {
        $0.isUserInteractionEnabled = true
        $0.setImage(UIImage(named: "movieImage"), for: .normal)
    }
    private let contentTextView = UITextView().then {
        $0.isEditable = false
        $0.backgroundColor = .red
        $0.contentInset = .init(top: 5, left: 5, bottom: 5, right: 5)
        $0.scrollIndicatorInsets = .init(top: 1, left: 1, bottom: 1, right: 1)
        $0.text = "2021년 4월 16일에 개봉한 명탐정 코난 제24기 극장판. 이번 작품의 주요 인물은 아카이 슈이치, 하네다 슈키치, 메리 세라, 세라 마스미 아카이 일가이다.\n이름에 있는 비색이라고 하면 한국어에서는 고려청자가 내는 푸른 빛을 가리키는 경우가 많은데, 본작의 제목에 사용된 것은 The Scarlet, 즉 셜록홈즈의 주홍색 연구에서도 쓰인 그 단어이다. 이해하기 쉽게 번역하자면 선홍색 탄환 쯤 된다. TV 에피소드였던 주홍색의 XX와 마찬가지로 제목이 셜록 홈즈 시리즈에서 영향을 받은 제목임을 고려하면 주홍색으로 번역하거나, 의미적으로 보아서 핏빛의 탄환 쯤도 해석해도 적절하겠다."
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 15)
        $0.textContainerInset = .init(top: 2, left: 2, bottom: 2, right: 2)
        $0.textInputView.backgroundColor = .white
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setConstraints()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Functions
    private func setUI() {
        [titleLabel, contentButton, contentTextView].forEach {
            addSubview($0)
        }
        self.backgroundColor = .white
    }
    
    private func setConstraints() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide).offset(30)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(UIScreen.main.bounds.width - 50)
            $0.height.equalTo(42)
        }
        contentButton.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.width - 100)
            $0.height.equalTo(250)
            $0.centerX.equalTo(titleLabel)
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        contentTextView.snp.makeConstraints {
            $0.centerX.equalTo(titleLabel)
            $0.width.equalTo(UIScreen.main.bounds.width - 20)
            $0.height.equalTo(150)
            $0.top.equalTo(contentButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-20)
        }
    }
}

