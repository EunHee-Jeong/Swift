//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by 정은희 on 2022/05/11.
//

import SwiftUI

struct ContentView: View {  // Root View (CustomView를 감싸고 있음)
    var body: some View {
        CustomView(helloFont: .headline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
