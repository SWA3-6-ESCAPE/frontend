//
//  SecondView2.swift
//  TeamProjectFix
//
//  Created by CNU on 2023/09/26.
//

import Foundation
import SwiftUI

struct SecondView2: View {
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
                                                
                                                Image("fire").resizable()
                                                Spacer()
                                                
                                                Text("화재")
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
                                                
                                                Image("flooded-house").resizable()
                                                Spacer()
                                                
                                                Text("침수")
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
                                                
                                                Image("landslide").resizable()
                                                Spacer()
                                                
                                                Text("산사태")
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
                                                
                                                Image("earthquake").resizable()
                                                Spacer()
                                                
                                                Text("시설 파손")
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
                                                
                                                Image("short-circuit").resizable()
                                                Spacer()
                                                
                                                Text("누전")
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
      
   


struct SecondView2_Previews: PreviewProvider {
    static var previews: some View {
        SecondView2()
    }
}
