//
//  NavigationView.swift
//  SwiftUIPractice
//
//  Created by 정은희 on 2022/05/12.
//

import SwiftUI

// SwiftUI에서는 NavigationController도 하나의 뷰로 표현된다.

struct NaviView: View {
    var body: some View {
        
        // 1. body에 NavigationView 추가
        NavigationView {
            VStack {
                Text("안뇽")
                    .navigationTitle("첫 번째 페이지")
                // 2. navigation 링크 추가
                NavigationLink(
                    destination: SecondView(),
                    label: {
                        Text("Navigate")
                    })
            }
        }
    }
}

// 3. 연결할 뷰 구조체 생성
struct SecondView: View {
    var body: some View {
        VStack {
            Text("두 번째 화면")
            
            NavigationLink(
                destination: FinalView(),
                label: {
                    Text("Navigate")
                })
        }
    }
}

struct FinalView: View {
    var body: some View {
        Text("마지막 화면~")
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NaviView()
    }
}
