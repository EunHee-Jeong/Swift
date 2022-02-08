//
//  RecommendCarDataModel.swift
//  NetworkExercise
//
//  Created by 정은희 on 2021/11/29.
//

// POSTMAN에서 Decode 해온 데이터 모델 구조체.

import Foundation

// MARK: - RecommendCarDataModel
struct RecommendCarDataModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [RecommendCars]
}

// MARK: - RecommendCars
struct RecommendCars: Codable {
    let carName, priceUnit: String
    let price, discountRate: Int
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case carName, priceUnit, price, discountRate
        case imageURL = "imageUrl"
        // imageUrl 대신 imageURL로 작성할 것이라는 소리...!
    }
}
