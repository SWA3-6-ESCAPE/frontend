//
//  ContentView.swift
//  TeamProjectFix
//
//  Created by CNU on 2023/09/26.
//

import SwiftUI

struct ContentView: View {
   @State private var selectedTab = 0
//    @StateObject private var locationManager = LocationDelegate()  // LocationDelegate를 사용하도록 수정

    init(selectedTab: Int = 0) {
        self._selectedTab = State(initialValue: selectedTab)
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FirstView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0) // 탭의 고유한 태그 값
            
            ThirdView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
                .tag(1) // 탭의 고유한 태그 값
            
            FourthView()
                .tabItem {
                    Label("Thread", systemImage: "square.and.pencil" )
                }
                .tag(2) // 탭의 고유한 태그 값
        }
//        .onAppear {
//            // 탭 뷰가 나타날 때, 선택된 탭을 설정합니다.
//            selectedTab = 0
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
