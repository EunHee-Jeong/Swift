//
//  ZStackView.swift
//  SwiftUIPractice
//
//  Created by 정은희 on 2022/05/12.
//

import SwiftUI

struct ZStackView: View {
    let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple]
    var body: some View {
        ZStack {
        // ZStack → Child View들이 화면에 Stack처럼 쌓이는 구조
            ForEach(0..<colors.count) {
                Rectangle()
                    .fill(colors[$0])
                    .frame(width: 100, height: 100)
                    .offset(x: CGFloat($0) * 10.0, y: CGFloat($0) * 10.0)
                // offset() → modifier method
                // modifier method → view hierarchy를 잡아주는 역할
            }
        }
    }
}

struct ZStackView_Previews: PreviewProvider {
    static var previews: some View {
        ZStackView()
    }
}
