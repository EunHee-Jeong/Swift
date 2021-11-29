//
//  ViewController.swift
//  NetworkExercise
//
//  Created by 정은희 on 2021/11/29.
//

// 1️⃣ Encode: Data Model -> JSON

struct PersonDataModel: Encodable {
    var name: String
    var age: Int
}

// 2️⃣ Decode: JSON -> Data Model

struct CoffeDataModel: Decodable {
    var drink: String
    var price: Int
    var orderer: String
    
    // 넘어오는 데이터의 구조가 바뀌었을 때 대응하기 위한 부분
    // 1. key의 이름이 바뀌었을 때
    enum CodingKeys: String, CodingKey {
        case drink
        case price = "coffee_price"
        case orderer
    }
    // 2. key-value쌍이 없을 때
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        drink = (try? values.decode(String.self, forKey: .drink)) ?? ""
        price = (try? values.decode(Int.self, forKey: .price)) ?? 0
        orderer = (try? values.decode(String.self, forKey: .orderer)) ?? ""
    }
}



import UIKit

class ViewController: UIViewController {
    
    let personData = PersonDataModel(name: "철수", age: 10)
    // 데이터 모델의 데이터 선언
    
    let coffeeData = """
        {
            "drink": "아메리카노",
            "price": 2000,
            "orderer": "JH",
        }
    """.data(using: .utf8)!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let jsonEncoder = JSONEncoder() // JSONEncoder 인스턴스 생성
        jsonEncoder.outputFormatting = .prettyPrinted
        
        // 오류처리를 위한 부분 (try -> do / catch)
        do {
            let data = try jsonEncoder.encode(personData)
            print(String(data: data, encoding: .utf8)!)
        }
        catch {
            print(error)
        }
        
        let jsonDecoder = JSONDecoder() // JSONDecoder 인스턴스 생성
        do {
            let order = try jsonDecoder.decode(CoffeDataModel.self, from: coffeeData)
            print("디코더 성공")
            dump(order) // dump() -> 성공시 자세한 정보 출력
        }
        catch {
            print(error)
        }
    }


}

