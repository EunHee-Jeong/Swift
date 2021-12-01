//
//  DelegatePracticeVC.swift
//  DataPassing
//
//  Created by 정은희 on 2021/12/01.
//

import UIKit

// 1️⃣ protocol / delegation을 활용해 데이터를 넘겨받는 방식

var nameList: [String] = [] // 버튼의 타이틀
var selectedNameList: [String] = [] // delegate를 구현하여 사용할 프로퍼티

class DelegatePracticeVC: UIViewController {
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var warningLabel: UILabel!
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        initDataList()
        registerCollectionView()
    }

    // MARK: - Custom Method
    
    func registerCollectionView() {
        let nibName = UINib(nibName: KeywordCVC.identifier, bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: KeywordCVC.identifier)
        collectionView.dataSource = self
    }
    
    func initDataList() {
        nameList.append(contentsOf: ["김루희","김선영","김소연","김수연","김승찬","김윤서","김인환",
                                     "김지수","김태현","김현규","김혜수","박예빈","박익범","배은서",
                                     "송지훈","신윤아","안현주","양수빈","이경민","이남준","이유진",
                                     "이준호","임주민","장혜령","정은희","정정빈","조양원","최은주",
                                     "최이준","홍승현","황지은"])
    }
}

// MARK: - Extensions

extension DelegatePracticeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameList.count   // 셀 개수 지정
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 셀 지정
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeywordCVC.identifier, for: indexPath) as? KeywordCVC else {return UICollectionViewCell()}
        cell.setKeyword(text: nameList[indexPath.row])  // 버튼의 타이틀 변경
        
        cell.keywordDelegate = self // ✅ 실제 처리는 DelegatePracticeVC에서 하도록 위임!!! (중요, 이거 없으면 적용 안됨)
        
        return cell
    }
}

extension DelegatePracticeVC: KeywordCellDelegate {
    func keywordCellSelected(cell: KeywordCVC) {
        selectedNameList.append(cell.keyword)
        print("selectedNameList = \(selectedNameList)")
        updateWarningLabel()
    }
    
    func keywordCellUnselected(cell: KeywordCVC, unselectedName: String) {
        let deletingIndex = selectedNameList.firstIndex(of: unselectedName) ?? -1   // 눌린 이름으로 인덱스를 찾음
        selectedNameList.remove(at: deletingIndex)  // 리스트에서 제거
        print("selectedNameList = \(selectedNameList)")
        updateWarningLabel()
    }
    
    func updateWarningLabel() {
        warningLabel.text = "\(selectedNameList.count)명이 선택되었습니다."
        warningLabel.textColor = selectedNameList.count > 8 ? .red : .black
    }
    
}
