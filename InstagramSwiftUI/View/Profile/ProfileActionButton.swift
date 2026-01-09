//
//  ProfileActionButton.swift
//  InstagramSwiftUI
//
//  Created by Terry Jason on 2026/1/1.
//

import SwiftUI

struct ProfileActionButton: View {
    
    var isFollowed: Bool = false
    var isCurrentUser: Bool = false
    
    var body: some View {
        
        if isCurrentUser {
            Button(action: {}) {
                Text("プロフィールを編集")
                    .font(.system(size: 15, weight: .semibold))
                    .frame(width: 360, height: 32)
                    .foregroundStyle(Color(uiColor: .label))
                    .overlay {
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color(uiColor: .label), lineWidth: 1)
                    }
            }
        } else {
            HStack {
                Button(action: {}) {
                    Text(isFollowed ? "フォロー中" : "フォロー")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundStyle(isFollowed ? Color(uiColor: .label) : .white)
                        .background(isFollowed ? .clear : .pink)
                        .overlay {
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(
                                    isFollowed ? Color(uiColor: .label) : .pink,
                                    lineWidth: 1
                                )
                        }
                }
                
                Button(action: {}) {
                    Text("メッセージ")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundStyle(Color(uiColor: .label))
                        .overlay {
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color(uiColor: .label), lineWidth: 1)
                        }
                }
            }
        }
    }
}

#Preview {
    ProfileActionButton()
}
