//
//  FavoriteDataModel.swift
//  NetworkExercise
//
//  Created by 정은희 on 2021/11/29.
//

import Foundation

// MARK: - FavoriteDataModel
struct FavoriteDataModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: Likes?    // 응답 바디가 실패일 경우를 대비하여 옵셔널로 선언
}

// MARK: - Likes
struct Likes: Codable {
    let carID: Int
    let isLiked: Bool

    enum CodingKeys: String, CodingKey {
        case carID = "carId"
        case isLiked
    }
}
