//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by 정은희 on 2022/05/12.
//

import SwiftUI

// 1. Picker에서 사용할 값들을 열거형으로 정의
enum Mood: String {
    case happy = "😀"
    case sad = "😭"
    case  upsideDown = "🙃"
    case ghost = "👻"
}

struct ContentView: View {
    
    // 2. 속성들을 추가
    @State var name: String = "Hello"
    @State var favoriteColor: Color = .blue
    @State var mood: Mood = Mood.happy
    
    var body: some View {
        VStack {
            StatusControl(name: $name, favoriteColor: $favoriteColor, mood: $mood)  // @Binding과 값을 연결하려면 $를 붙여줘야 함 !!!
            StatusIcon(name: name, favoriteColor: favoriteColor, mood: mood)
        }
    }
}

struct StatusControl: View {
    // 동적으로 값을 받아오기 위한 @Binding 어노테이션 !!
    @Binding var name: String
    @Binding var favoriteColor: Color
    @Binding var mood: Mood
    
    var body: some View {
        // 3. HStack으로 감싼 Control 생성
        HStack {
            TextField("Name", text: $name)
            ColorPicker("Favorite Color", selection: $favoriteColor)
            Picker("Mood", selection: $mood) {
                Text(Mood.happy.rawValue).tag(Mood.happy)
                Text(Mood.happy.rawValue).tag(Mood.happy)
                Text(Mood.happy.rawValue).tag(Mood.happy)
                Text(Mood.happy.rawValue).tag(Mood.happy)
            }
            .pickerStyle(SegmentedPickerStyle())
        }.padding()
    }
}

struct StatusIcon: View {
    let name: String
    let favoriteColor: Color
    let mood: Mood
    
    var body: some View {
        // 4. Control의 결과값을 표시하기 위한 아이콘 (VStack 사용)
        VStack {
            VStack {
                Text(mood.rawValue)
                Text(name)
                    .foregroundColor(.white)
            }
            .font(.largeTitle)
            .padding()
            .background(favoriteColor)
            .cornerRadius(12)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
