//
//  PracticeView.swift
//  SwiftUIPractice
//
//  Created by 정은희 on 2022/05/12.
//

import SwiftUI

struct PracticeView: View {
    var body: some View {
        ZStack {
            // MARK: - 배경색 지정
//            Color.blue  // 배경색 채우기
            Color.red.edgesIgnoringSafeArea(.all)   // 상태바에도 배경색 채우기
            
            // MARK: - Title Text
            VStack {
                Text("SwiftUI")
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
            }
        }
    }
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView()
    }
}
