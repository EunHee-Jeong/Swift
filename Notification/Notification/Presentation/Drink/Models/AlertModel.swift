//
//  AlertModel.swift
//  Notification
//
//  Created by 정은희 on 2022/03/08.
//

import Foundation

struct AlertModel: Codable {
    var id: String = UUID().uuidString
    let date: Date
    var isOn: Bool
    
    // ✅ date 값을 받으면 시간, 오전/오후로 변환하는 코드
    var time: String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh:mm"
        return timeFormatter.string(from: date)
    }
    var meridiem: String {
        let meridiemFormatter = DateFormatter()
        meridiemFormatter.dateFormat = "a"
        meridiemFormatter.locale = Locale(identifier: "ko")
        return meridiemFormatter.string(from: date)
    }
}
