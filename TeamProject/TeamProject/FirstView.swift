//
//  FirstView.swift
//  TeamProject
//
//  Created by CNU on 2023/08/27.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.blue.opacity(0.1).edgesIgnoringSafeArea(.all)
                
                NavigationLink {
                    IncidentDisasterButton()
                } label: {
                    ZStack {
                        Image("siren")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                    }
                }
            }
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
