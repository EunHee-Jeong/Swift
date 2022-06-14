//
//  NetworkResult.swift
//  JSON-Mock
//
//  Created by 정은희 on 2022/05/26.
//

import Foundation

/*
 서버통신 결과를 처리하기 위한 파일
 타입 파라미터로 선언해, 여러 타입들이 들어올 수 있도록 함.
 */

enum NetworkResult<T> {
    case success(T) // 서버통신 성공
    case requestErr(T)  // 요청 오류
    case pathErr    // 경로 오류
    case serverErr  // 서버 내부 오류
    case networkFail    // 네트워크 연결 실패
}
