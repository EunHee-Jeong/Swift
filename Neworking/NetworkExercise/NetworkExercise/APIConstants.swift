//
//  APIConstants.swift
//  NetworkExercise
//
//  Created by 정은희 on 2021/11/29.
//

import Foundation

// Base URL을 먼저 만들고,
// 추후에 API마다 필요한 경로에 따라 변수를 추가해주는 식으로 쉽게 관리하기 위한 파일

struct APIConstants {
    
    // MARK: - Base URL
    static let baseURL = "https://asia-northeast3-socar-server-814e9.cloudfunctions.net/api"
    
    // MARK: - Feature URL
    static let recommendURL = baseURL + "/my/recommend"
    static let favoriteURL = baseURL + "/my/favorite"
}
