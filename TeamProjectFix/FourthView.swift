//
//  FourthView.swift
//  TeamProjectFix
//
//  Created by CNU on 2023/09/26.
//

import Foundation
import SwiftUI

class Post: Identifiable, ObservableObject {
    var id = UUID()
    var content: String
    @Published var likes: Int
    var subPosts: [Post] = []  // 하위 게시글을 위한 배열

    init(content: String, likes: Int, subPosts: [Post] = []) {
        self.content = content
        self.likes = likes
        self.subPosts = subPosts
    }
}

struct FourthView: View {
    @State private var posts: [Post] = []
    @State private var showingNewPostView: Bool = false // 추가된 상태 변수

    var body: some View {
        NavigationView {
            List(posts) { post in
                NavigationLink(destination: PostDetailView(post: post, allPosts: $posts)) {
                    VStack(alignment: .leading) {
                        Text(post.content)
                        Text("공감: \(post.likes)").font(.subheadline).foregroundColor(.gray)
                    }
                }
            }
            .navigationBarTitle("신고 목록", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: addPost) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingNewPostView) { // 모달로 게시글 작성 화면을 보여줌.
                NewPostView(onSave: { content in
                    self.posts.append(Post(content: content, likes: 0))
                    self.showingNewPostView = false
                }, onCancel: {
                    self.showingNewPostView = false
                })
            }
        }
    }

    func addPost() {
        showingNewPostView = true // 게시글 작성 화면을 보여주기 위해 상태 변수 값을 변경
    }
}

struct PostDetailView: View {
    @ObservedObject var post: Post
    @Binding var allPosts: [Post]
    @State private var showingNewPostView: Bool = false
    @State var subPosts: [Post]
    


    var body: some View {
           VStack(alignment: .leading) {
               Text(post.content)
               HStack {
                   Text("공감: \(post.likes)").font(.subheadline).foregroundColor(.gray)
                   Button(action: {
                       post.likes += 1
                   }) {
                       Image(systemName: "hand.thumbsup")
                   }
               }
               Spacer()
               List(subPosts) { subPost in  // 하위 게시글 목록
                   Text(subPost.content)
               }
               Button("새 신고글 작성") {
                   showingNewPostView = true
               }
               .padding()
           }
           .navigationBarTitle("신고글 상세", displayMode: .inline)
           .sheet(isPresented: $showingNewPostView) {
               NewPostView(onSave: { content in
                   let newPost = Post(content: content, likes: 0)
                   self.subPosts.append(newPost)  // <-- 게시글에 하위 게시글 추가
                   if let index = allPosts.firstIndex(where: { $0.id == post.id }) {
                       allPosts[index].subPosts = self.subPosts
                   }
                   self.showingNewPostView = false
               }, onCancel: {
                   self.showingNewPostView = false
               })
           }
       }

    

    init(post: Post, allPosts: Binding<[Post]>) {
        self._post = ObservedObject(initialValue: post)
        self._allPosts = allPosts
        _subPosts = State(initialValue: post.subPosts)
    }
}

struct NewPostView: View {
    @State private var content: String = ""
    var onSave: (String) -> Void
    var onCancel: () -> Void  // new onCancel closure

    var body: some View {
        VStack {
            Text("새 신고글 작성")
                .font(.headline)
                .padding()

            TextEditor(text: $content)
                .padding()
                .border(Color.gray, width: 1)

            HStack {
                Button(action: { onSave(content) }) {
                    Text("저장")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()

                Button(action: onCancel) {
                    Text("취소")
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
        }
    }
}



struct FourthView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
