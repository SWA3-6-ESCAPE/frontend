//
//  FirstView.swift
//  TeamProjectFix
//
//  Created by CNU on 2023/09/26.
//

import Foundation
import SwiftUI

struct FirstView: View {
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.blue.opacity(0.1).edgesIgnoringSafeArea(.all)
                
                NavigationLink {
                    IncidentDisasterButton()
                } label: {
                    Image("siren")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
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
