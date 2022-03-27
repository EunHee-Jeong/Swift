//
//  Dictionary+Extension.swift
//  NetworkExercise
//
//  Created by 정은희 on 2021/11/29.
//

import Foundation
import Alamofire

/*
 Alamofire에서는 [String:String] 형식의 HTTPHeaders만 지원한다.
 API 문서의 request header id값이 int로 들어왔기 때문에, 별도로 extension을 추가해줘야 한다.
*/

extension Dictionary where Key == String, Value == Any {
    func toHTTPHeaders() -> HTTPHeaders {
        HTTPHeaders(mapValues { String(describing: $0) })
    }
}
