//
//  NetworkResult.swift
//  NetworkExercise
//
//  Created by 정은희 on 2021/11/29.
//

import Foundation

enum NetworkResult<T> {
    case success(T) // 서버 통신 성공
    case requestErr(T)  // 요청 오류 발생
    case pathErr    // 경로 오류 발생
    case serverErr  // 서버 내부의 오류 발생
    case networkFail    // 네트워크 연결 실패
}
