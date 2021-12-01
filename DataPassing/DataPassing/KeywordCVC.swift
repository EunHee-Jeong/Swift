//
//  KeywordCVC.swift
//  DataPassing
//
//  Created by 정은희 on 2021/12/01.
//

import UIKit

protocol KeywordCellDelegate {
    // 1. 대리자 모집 공고
    func keywordCellSelected(cell: KeywordCVC)
    func keywordCellUnselected(cell: KeywordCVC, unselectedName: String)
}

class KeywordCVC: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "KeywordCVC"
    var keyword: String = ""
    var selectedKeyword: Bool = false
    var keywordDelegate: KeywordCellDelegate?   // 2. 대리자가 들어올 자리
    
    // MARK: - @IBOutlet Properties

    @IBOutlet var keywordButton: UIButton!
    
    // MARK: - View Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK: - @IBAction Properties

    @IBAction func touchUpToSelect(_ sender: Any) {
        // 3. 대리자 모집 공고에 나와 있던 일을 시키는 부분
        if selectedKeyword {    // "선택되어 있던" 상태라면 (selectedKeyword)
            keywordDelegate?.keywordCellUnselected(cell: self,
                                                   unselectedName: keyword)
            /*
             keywordCellUnselected() -> 대리자 keywordDelegation의 함수
             어떤 KeywordDelegate이 들어올지에 따라 실질적인 내용 바뀜
             */
            keywordButton.backgroundColor = .clear
        } else {    // "선택되지 않은" 상태라면
            keywordDelegate?.keywordCellSelected(cell: self)
            keywordButton.backgroundColor = .yellow
        }
        selectedKeyword.toggle()
    }
    
    // MARK: - Custom Method
    
    func setKeyword(text: String) {
        // 버튼의 키워드를 바꾸는 함수 (외부에서 접근)
        keyword = text
        keywordButton.setTitle(keyword, for: .normal)
    }

}
