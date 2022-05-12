//
//  CustomView.swift
//  SwiftUIPractice
//
//  Created by 정은희 on 2022/05/11.
//

import SwiftUI

// View 프로토콜을 준수하는 구조체를 정의해 CustomView를 선언.
/*
 프로토콜 -> 기능에 대한 청사진 제공
 View -> SwiftUI가 화면에 그리는 요소의 동작을 나타냄
 */
struct CustomView: View {
    let helloFont: Font
    
    // body -> View 업데이트 때마다 읽힘 (View Life Cycle에 해당)
    var body: some View {
        // some -> 불명확한 타입에 붙여줌
        /*
         some View -> body의 속성이 View를 준수한다는 것까지만 알려주는 것
         (body 안에 어떤 것들이 선언될 지 알 수 없기 때문...)
         = 정확한 type을 명시적으로 표현하지 않고 프레임워크 자체에서 추론하도록 함
         */
        VStack {    // 클로저가 중첩으로 나열된 구조
            VStack { // 세로로 쌓음
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).font(.title)
                Text("만나서 반가워요 ㅋ")
            }
            VStack {
                Text("Hello").font(helloFont)
            }
        }
    }
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        CustomView(helloFont: .headline)
    }
}
