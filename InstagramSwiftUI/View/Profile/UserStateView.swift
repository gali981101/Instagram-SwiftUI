//
//  UserStateView.swift
//  InstagramSwiftUI
//
//  Created by Terry Jason on 2026/1/1.
//

import SwiftUI

struct UserStateView: View {
    
    let value: Int
    let title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(value)")
                .font(.system(size: 15, weight: .semibold))
            
            Text(title)
                .font(.system(size: 15))
        }
        .frame(width: 80)
    }
}

#Preview {
    UserStateView(value: 2, title: "フォロワー")
}
