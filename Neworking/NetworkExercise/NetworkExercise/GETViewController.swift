//
//  GETViewController.swift
//  NetworkExercise
//
//  Created by 정은희 on 2021/11/29.
//

import UIKit

class GETViewController: UIViewController {

    // MARK: - @IBOutlet Properties
    
    @IBOutlet var nameLabel: UILabel!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - @IBAction Properties

    @IBAction func getButtonClicked(_ sender: Any) {
        
        GetRecommendDataService.shared.getRecommendInfo(userId: 1) { (response) in
            // GetRecommendDataService 구조체에서 공용 인스턴스 shared에 접근
            
            switch(response)
            {
            case .success(let recommendData):   // recommendData => 성공시 클로저에서 넘어오는 데이터
                if let data = recommendData as? RecommendCars {
                    self.nameLabel.text = data.carName
                }
            case .requestErr(let message):
                print("requestErr", message)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
}
