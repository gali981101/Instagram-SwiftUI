//
//  ProfileHeaderView.swift
//  InstagramSwiftUI
//
//  Created by Terry Jason on 2025/12/26.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("涼森")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                
                Spacer()
                
                HStack(spacing: 16) {
                    UserStateView(value: 1, title: "投稿")
                    UserStateView(value: 2, title: "フォロワー")
                    UserStateView(value: 3, title: "フォロー中")
                }
                
                Spacer()
            }
            
            Text("涼森れむ")
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            
            Text("最も透明な美しさ")
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top, 1)
            
            HStack {
                
                Spacer()
                
                ProfileActionButton()
                
                Spacer()
            }
            .padding(.top)
        }
    }
}

#Preview {
    ProfileHeaderView()
}
