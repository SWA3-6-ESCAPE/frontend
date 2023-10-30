//
//  IncidentDisasterButton.swift
//  TeamProjectFix
//
//  Created by CNU on 2023/09/26.
//

import Foundation
import SwiftUI

struct IncidentDisasterButton: View {
    @Environment(\.dismiss) private var dismiss
    
    func pop() -> Void {
        dismiss()
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.blue.opacity(0.1).edgesIgnoringSafeArea(.all)
                
                VStack {
                    NavigationLink {
                        IncidentSelection()
                    } label: {
                        Image("incident")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                    }
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 5)
                    
                    Button(action: pop) {
                        Image("siren")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                    }
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 7)
                    
                    NavigationLink {
                        DisasterSelection()
                    } label: {
                        Image("disaster")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                    }
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 12)
                }
            }
        }
    }
}

struct IncidentDisasterButton_Previews: PreviewProvider {
    static var previews: some View {
        IncidentDisasterButton()
    }
}
