//
//  Write.swift
//  TeamProjectFix
//
//  Created by CNU on 2023/09/26.
//

import Foundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Binding var isImagePickerPresented: Bool

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        imagePicker.sourceType = .photoLibrary
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Nothing to do here
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedImage = uiImage
            }
            parent.isImagePickerPresented = false
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isImagePickerPresented = false
        }
    }
}


struct write: View {
    @State var text: String = ""
    @State private var isPresented = false
    
    @State private var isImagePickerPresented = false
    @State private var selectedImage: UIImage? = nil
    @State private var isImageSelected = false
    
//    @ObservedObject var tabSelection: TabSelection
    
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
                    
                    
                    ZStack {
                        let placeholder: String = "자세한 설명을 적어주세요."
                        
                        TextEditor(text: $text)
                            .cornerRadius(15)
                            .padding()
                            .frame(height: 180)
                        if text.isEmpty {
                            Text(placeholder).foregroundColor(Color.primary.opacity(0.25)).padding(.bottom, 100)
                        }
                    }
                    
                    Button(action: {
                        print("사진첨부")
                        self.isImagePickerPresented.toggle()
                    }, label: {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: 150, height: 50)
                            .overlay(
                                HStack {
                                    Image(systemName: "photo.fill")
                                        .foregroundColor(.black)
                                    Text("사진 첨부")
                                        .foregroundColor(.black)
                                }
                            )
                            .cornerRadius(10)
                    }).sheet(isPresented: $isImagePickerPresented) {
                        ImagePicker(selectedImage: self.$selectedImage, isImagePickerPresented: self.$isImagePickerPresented)
                    }
                    
                    
                    
                    if let selectedImage = selectedImage {
                        Spacer()
                        Image(uiImage: selectedImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:200, height: 140)
                            .overlay(
                                Button(action: {
                                    self.selectedImage = nil
                                    self.isImageSelected = false
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.white)
                                        .background(Color.black)
                                        .padding(5)
                                }
                                .offset(x: 110, y: -55)
                            )
                    }else {
                        Rectangle()
                            .foregroundColor(Color(red: 234 / 255, green: 243 / 255, blue: 250 / 255))
                            .frame(width:200, height: 140)
                    }
                    
                    /*ZStack {
                        NavigationLink {
                            ContentView()
                        } label: {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.red)
                                    .frame(width: 140, height: 70)
                                    .overlay(Text("보내기")
                                        .foregroundColor(.white))
                                    .cornerRadius(15)
                            }
                        }
                    }*/
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    
                    Button(action: {
                        // 버튼 클릭 시 실행할 코드
                        isPresented = true
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.red)
                                .frame(width: 140, height: 70)
                                .overlay(Text("보내기")
                                    .foregroundColor(.white))
                                .cornerRadius(15)
                        }
                    }.fullScreenCover(isPresented: $isPresented, content: {
                        ContentView(selectedTab: 1)
                    })
                    
                    
                    
                    
                    
                }
            }
        }
    }
}



struct write_Previews: PreviewProvider {
    static var previews: some View {
        write()
    }
}

