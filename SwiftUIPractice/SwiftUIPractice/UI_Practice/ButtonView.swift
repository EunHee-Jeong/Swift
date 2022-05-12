//
//  ButtonView.swift
//  SwiftUIPractice
//
//  Created by 정은희 on 2022/05/12.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            // 4. 버튼을 ZStack에 랜더링
            VStack {
                Text("SwiftUI")
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                Spacer() // 5. Title, 버튼 분리
                MyButton(title: "Click Me", iconName: "paperplane.circle").padding()
            }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}

// MARK: - CustomView
// 1. View 프로토콜을 채택받는 구조체 만들기
struct MyButton: View {
    // 2. 필요한 프로퍼티들을 변수로 선언
    var title: String
    var iconName: String
    
    // 3. body 변수에 뷰 작성
    var body: some View {
        Button(action: {
            // 이벤트 영역
            print("버튼 tapped~")
        }) {
            HStack {
                Image(systemName: iconName)
                    .font(.title)
                Text(title)
                    .fontWeight(.semibold)
                    .font(.title)
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.red)
            .cornerRadius(40)
        }
    }
}
