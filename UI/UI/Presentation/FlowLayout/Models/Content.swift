//
//  Content.swift
//  UI
//
//  Created by 정은희 on 2022/03/12.
//

import UIKit

struct Content: Decodable {
    let sectionType: SectionType
    let sectionName: String
    let contentItem: [Item]
    
    // sectionType이 String형의 케이스 타입들로 나뉘는 형태이기 때문에 직관적으로 하기 위해 enum으로 바꿔줌.
    enum SectionType: String, Decodable {
        case basic
        case main
        case large
        case rank
    }
}

struct Item: Decodable {
    let description: String
    let imageName: String
    
    var image: UIImage {
        return UIImage(named: imageName) ?? UIImage()   // 옵셔널 처리. (만약 그 이미지가 없다면 그냥 이미지를 반환)
    }
}
