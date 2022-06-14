//
//  SignDataModel.swift
//  JSON-Mock
//
//  Created by 정은희 on 2022/05/26.
//

import Foundation

/*
 네트워크 통신 결과로 넘어오는 JSON 형태의 메시지를 Swift로 변환하는 부분 (= Decode)
 */

struct LoginResponse: Codable {
    let status: Int
    let success: Bool?
    let messgae: String
    let data: LoginData?    // 요청 실패를 대비해 옵셔널로 선언
}

struct LoginData: Codable {
    let name: String
    let email: String
}
