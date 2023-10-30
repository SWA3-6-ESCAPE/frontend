//
//  SecondView.swift
//  TeamProjectFix
//
//  Created by CNU on 2023/09/26.
//

import Foundation
import SwiftUI

struct SecondView: View {
    @State private var isWriteViewPresented = false // 네비게이션을 제어할 상태 변수
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 234 / 255, green: 243 / 255, blue: 250 / 255).ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Rectangle()
                        .foregroundColor(Color.white)
                        .frame(width: 350, height: 80)
                        .overlay(Text("5시 13분에 범죄신고 이력이 있습니다\n위치 : 대전광역시 유성구 대학로 99"))
                        .cornerRadius(15)
                        .shadow(radius: 5)
                    
                    Spacer()
                    Spacer()
                    
                    
                    HStack {
                        
                        ZStack {
                            NavigationLink {
                                write()
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .frame(width: 180, height: 180)
                                        .overlay(
                                            VStack {
                                                
                                                Image("car-crash").resizable()
                                                Spacer()
                                                
                                                Text("교통사고")
                                                    .foregroundColor(.black)
                                                Spacer()
                                            }
                                            
                                        )
                                        .cornerRadius(20)
                                }
                            }
                        }
                        
                        ZStack {
                            NavigationLink {
                                write()
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .frame(width: 180, height: 180)
                                        .overlay(
                                            VStack {
                                                
                                                Image("knife").resizable()
                                                Spacer()
                                                
                                                Text("흉기 난동")
                                                    .foregroundColor(.black)
                                                Spacer()
                                            }
                                            
                                        )
                                        .cornerRadius(20)
                                }
                            }
                        }
                        
                        
                    
                    }
                    
                    
                    HStack {
                        
                        ZStack {
                            NavigationLink {
                                write()
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .frame(width: 180, height: 180)
                                        .overlay(
                                            VStack {
                                                
                                                Image("thief").resizable()
                                                Spacer()
                                                
                                                Text("절도")
                                                    .foregroundColor(.black)
                                                Spacer()
                                            }
                                            
                                        )
                                        .cornerRadius(20)
                                }
                            }
                        }
                        
                        
                        
                        ZStack {
                            NavigationLink {
                                write()
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .frame(width: 180, height: 180)
                                        .overlay(
                                            VStack {
                                                
                                                Image("violent-criminal").resizable()
                                                Spacer()
                                                
                                                Text("폭행")
                                                    .foregroundColor(.black)
                                                Spacer()
                                            }
                                            
                                        )
                                        .cornerRadius(20)
                                }
                            }
                        }
                        
                                    
                                        
                    }
                    
                    
                    HStack {
                        
                        ZStack {
                            NavigationLink {
                                write()
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .frame(width: 180, height: 180)
                                        .overlay(
                                            VStack {
                                                
                                                Image("pistol").resizable()
                                                Spacer()
                                                
                                                Text("강도")
                                                    .foregroundColor(.black)
                                                Spacer()
                                            }
                                            
                                        )
                                        .cornerRadius(20)
                                }
                            }
                        }
                        
                        
                        ZStack {
                            NavigationLink {
                                write()
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .frame(width: 180, height: 180)
                                        .overlay(
                                            VStack {
                                                
                                                
                                                Spacer()
                                                
                                                Text("기타")
                                                    .foregroundColor(.black)
                                                Spacer()
                                            }
                                            
                                        )
                                        .cornerRadius(20)
                                }
                            }
                        }
                        
                                    
                                        
                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    
                    
                    
                    
                    
                    
                }
            }
            
        }
    }
}



struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
