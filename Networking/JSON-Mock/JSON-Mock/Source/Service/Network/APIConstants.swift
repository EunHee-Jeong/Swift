//
//  APIConstants.swift
//  JSON-Mock
//
//  Created by 정은희 on 2022/05/26.
//

import Foundation

/*
 URI를 관리하기 쉽도록 API 주소들을 모아 놓은 파일
 BaseURL과 나머지 경로들을 작성함. (나누어 관리)
 */

struct APIConstants {
    // MARK: - Base URL
    static let baseURL = "http://13.124.62.236"
    
    // MARK: - Feature URL
    static let loginURL = baseURL + "/auth/signin"
}
