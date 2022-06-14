//
//  UserService.swift
//  JSON-Mock
//
//  Created by 정은희 on 2022/05/26.
//

import Foundation

import Alamofire

/*
 Request, Response의 통신 코드를 작성하는 부분
 */

class UserService {
    // 1. 서비스 코드를 작성할 클래스 생성
    
    static let shared = UserService()   // Singleton 객체로 선언해, 프로젝트 파일 전역에서 접근할 수 있도록 함.
    
    // 2. 통신 시 사용할 함수 정의
    // 매개변수로 Request에 필요한 값들과 completion 클로저를 넣어줌
    func login(
        name: String,
        email: String,
        password: String,
        completion: @escaping (NetworkResult<Any>) -> Void
    ) {
        // API 명세서를 바탕으로 필요한 값들 준비
        let url = APIConstants.loginURL
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let body: Parameters = [
            "name": name,
            "email": email,
            "password": password
        ]
        
        // 요청서 작성
        let dataRequest = AF.request(
            url,
            method: .post,
            parameters: body,
            encoding: JSONEncoding.default,
            headers: header
        )
        
        // 통신 시작
        dataRequest.responseData { response in
            // 통신의 결과 (= response) 를 성공, 실패 여부에 따라 분기처리
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode,
                      let value = response.value
                else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    // 서버통신 자체는 성공일지라도, 응답 실패로 원하는 데이터를 받지 못하는 상태를 분기처리해주기 위한 메서드
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200:
            return isValidData(data: data)
        case 400:
            return .pathErr
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    // 통신이 성공하고 원하는 데이터가 올바로 들어왔을 때, 데이터 처리를 위한 함수
    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(LoginResponse.self, from: data)
        else { return .pathErr }
        
        return .success(decodedData.data as Any)
    }
}
