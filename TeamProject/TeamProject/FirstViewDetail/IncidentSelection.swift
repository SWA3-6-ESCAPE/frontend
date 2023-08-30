//
//  IncidentSelection.swift
//  TeamProject
//
//  Created by CNU on 2023/08/28.
//

import SwiftUI

struct IncidentSelection: View {
    @State private var showSecondView = false
    
    var body: some View {
        ZStack{
            Color.blue.opacity(0.1).edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .frame(width: 300, height: 220)
                .foregroundColor(.white)
                .cornerRadius(15)

            VStack{
                Text("범죄가 신고되었습니다")
                    .font(.system(size: 27, weight: .bold).italic())
                    .multilineTextAlignment(.center)
                    .padding()
                Text("먼저 안전한 곳으로 대피하신 후,")
                    .font(.system(size: 18, weight: .regular).italic())
                    .multilineTextAlignment(.center)
                Text("정확한 상황을 공유해주세요.")
                    .font(.system(size: 18, weight: .regular))
                    .multilineTextAlignment(.center)
                    
                Button (action:{
                    showSecondView = true
                }) {
                        Text("확인")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                .sheet(isPresented: $showSecondView){
                    SecondView()
                }
            }
        }
    }
}

struct IncidentSelection_Previews: PreviewProvider {
    static var previews: some View {
        IncidentSelection()
    }
}
