//
//  NotificationCell.swift
//  InstagramSwiftUI
//
//  Created by Terry Jason on 2025/12/25.
//

import SwiftUI

struct NotificationCell: View {
    
    @State private var showPostImage = true
    
    var body: some View {
        
        HStack {
            Image("深田")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(notificationText(
                    userName: "深田",
                    actionText: "あなたの投稿に「いいね！」しました。"
                ))
                .foregroundColor(.primary)
                .fixedSize(horizontal: false, vertical: true)
            }
            
            Spacer()
            
            if showPostImage {
                Image("photo5")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
            } else {
                Button {
                    
                } label: {
                    Text("フォロー")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color(.pink))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .font(.system(size: 14, weight: .semibold))
                }
                
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    NotificationCell()
}
