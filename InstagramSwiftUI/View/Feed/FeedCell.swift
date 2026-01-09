//
//  FeedCell.swift
//  InstagramSwiftUI
//
//  Created by Terry Jason on 2025/12/23.
//

import SwiftUI

struct FeedCell: View {
    
    @State var postImage: Image
    @State var postCaption: String
    
    @State private var expanded = false
    @State private var showSheet = false
    
    let onEdit: () -> Void
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Image("涼森")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                
                Text("涼森れむ")
                    .font(.system(size: 14, weight: .semibold))
                
                Spacer()
                
                Button(action: {
                    showSheet = true
                }) {
                    Image(systemName: "ellipsis")
                        .padding(.horizontal, 8)
                }
                .sheet(isPresented: $showSheet) {
                    IGStyleSheet(showSheet: $showSheet, onEdit: onEdit)
                        .presentationDetents([.medium])
                        .presentationDragIndicator(.visible)
                }
                .foregroundStyle(Color(uiColor: .label))
            }
            .padding([.leading, .bottom], 8)
            
            Image("photo1")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .frame(height: 320)
                .background(Color.black)
            
            HStack(spacing: 16) {
                Button(action: {}) {
                    Image(systemName: "heart")
                        .actionIconStyle()
                }
                
                Button(action: {}) {
                    Image(systemName: "bubble.left")
                        .actionIconStyle()
                }
                
                Button(action: {}) {
                    Image(systemName: "paperplane")
                        .actionIconStyle()
                }
            }
            .padding(.leading, 8)
            .foregroundStyle(Color(uiColor: .label))
            
            Text("いいね！3件")
                .font(.system(
                    size: 14,
                    weight: .semibold
                ))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            
            NameContentView(
                name: "涼森れむ",
                content: " 水汪々とした瞳を持つAV女優・涼森れむは、インタビューで、当初は挑戦性の高い職業を求めていたこと、そして女優・凰香奈芽を尊敬していたことからAV業界に入ったと語っている。現在では、制作会社からも力を入れて推されるトップ女優の一人となっている。昨年には白金女優として2023 TREにも登場し、その親しみやすさで多くのファンの心を再び掴んだ。しかし、外見はまるで仙気漂う女神のような涼森れむだが、私生活では意外にもアウトドア派である。先日、Instagramに大きな海の魚を手に持つ写真を投稿したことで、彼女が海釣りに熱中していることが判明した。また、台湾のYouTuberのインタビューでは、休日は釣りやゴルフを楽しむこともあると語っており、その仙気ある外見とのギャップがファンの間で「反差萌」として話題となっている。".padded,
                expanded: $expanded
            )
            
            Text("2日")
                .font(.system(size: 14))
                .foregroundStyle(.gray)
                .padding(.leading, 8)
                .padding(.top, 2)
        }
    }
}

struct IGStyleSheet: View {
    
    @Binding var showSheet: Bool
    
    let onEdit: () -> Void
    
    var body: some View {
        
        VStack(spacing: 16) {
            
            Button(action: {
                showSheet = false
                onEdit()
                
            }) {
                Text("編集")
                    .igButtonStyle(
                        background: .black,
                        foreground: .white
                    )
            }
            
            Button(action: {
                showSheet = false
            }) {
                Text("削除")
                    .igButtonStyle(
                        background: .red,
                        foreground: .white
                    )
            }
            
            Button(action: {
                showSheet = false
            }) {
                Text("取消")
                    .igButtonStyle(
                        background: .white,
                        foreground: .black
                    )
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    FeedCell(
        postImage: Image("photo1"),
        postCaption: "水泳が大好きです！新しい作品を応援してください！",
        onEdit: {}
    )
}
