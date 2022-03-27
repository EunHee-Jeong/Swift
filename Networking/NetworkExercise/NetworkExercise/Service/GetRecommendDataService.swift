//
//  GetRecommendDataService.swift
//  NetworkExercise
//
//  Created by 정은희 on 2021/11/29.
//

import Foundation

import Alamofire

struct GetRecommendDataService
{
    static let shared = GetRecommendDataService()   // 싱글톤 인스턴스 생성
    // ➡️ 여러 VC에서 shared를 통해 같은 인스턴스에 접근할 수 있게 함
    
    func getRecommendInfo(userId: Int,
                          completion: @escaping (NetworkResult<Any>) -> Void)
    /*
     escape closure 형태로 completion 정의
     이 함수가 종료되든 말든 상관 없이, 전달만 된다면 이후에 외부에서도 사용 가능하게 함.
     여기서 용도 ➡️ 해당 네트워크 작업이 끝날 때 completion 클로저에 결과를 담아서 호출
     그 결과는 VC에서 처리.
     */
    {
        // 1. 데이터를 받아오기 위한 주소 정의
        let URL = "https://asia-northeast3-socar-server-814e9.cloudfunctions.net/api/my/recommend"
        let header: [String: Any] = [
            "Content-Type": "application/json",
            "userId": userId
        ]
        
        // 2. 통신을 위한 요청서 작성
        let dataRequest = AF.request(URL,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header.toHTTPHeaders())
        
        // 3. 2번에서 정의한 요청서로 서버에 통신 request
        dataRequest.responseData { dataResponse in
            // 통신이 완료 되면 클로저를 통해 dataResponse라는 이름으로 결과가 도착함
            
            switch dataResponse.result {    // 통신 결과물들
                
            case .success:
                guard let statusCode = dataRequest.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure: completion(.pathErr)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        // statusCode를 바탕으로 결과값을 어떻게 처리할지 정의하는 함수
        
        switch statusCode {
        case 200: return isValidData(data: data)    // 성공이라면 데이터를 가공해서 전달해야 하기 때문에 isValidData 함수로 넘겨줌
            
        // 나머지 -> NetworkResult형으로 반환.
        // completion 클로저에 넣어서 VC로 날리면 거기서 분기처리 해주면 됨
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        // 데이터를 가공해주기 위한 함수
        
        let decoder = JSONDecoder()
        
        // 1. 만들어둔 데이터모델 형태로 해독 먼저 하고,
        guard let decodedData = try? decoder.decode(RecommendResponseData.self, from: data) else {return .pathErr}
        // 2. 성공하면 success에 넣어줌
        return .success(decodedData)   // 이제 VC에서 data를 빼서 쓸 수 있다!!
    }
}
