//
//  FavoriteDataModel.swift
//  NetworkExercise
//
//  Created by 정은희 on 2021/11/29.
//

import Foundation

// MARK: - FavoriteResponseData
struct FavoriteResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: FavoriteResultData?
}

// MARK: - FavoriteResultData
struct FavoriteResultData: Codable {
    let carID: Int
    let isLiked: Bool

    enum CodingKeys: String, CodingKey {
        case carID = "carId"
        case isLiked
    }
}
