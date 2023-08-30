//
//  ContentView.swift
//  TeamProject
//
//  Created by CNU on 2023/08/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
        
            FirstView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ThirdView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            
            FourthView()
                .tabItem {
                    Label("Thread", systemImage: "square.and.pencil" )
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
