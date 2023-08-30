//
//  IncidentDisasterButton.swift
//  TeamProject
//
//  Created by CNU on 2023/08/28.
//

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
                    ZStack {
                        NavigationLink {
                            IncidentSelection()
                        } label: {
                            ZStack {
                                Image("incident")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 300)
                            }
                        }
                        .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 5)
                    }
                    
                    ZStack {
                        Button(action: pop) {
                            ZStack {
                                Image("siren")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100)
                            }
                        }
                        .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 7)
                    }
                    
                    ZStack {
                        NavigationLink {
                            DisasterSelection()
                        } label: {
                            ZStack {
                                Image("disaster")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 300)
                            }
                        }
                        .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 12)
                    }
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
