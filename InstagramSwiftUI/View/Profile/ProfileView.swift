//
//  ProfileView.swift
//  InstagramSwiftUI
//
//  Created by Terry Jason on 2025/12/22.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeaderView()
                PostGridView()
            }
            .padding(.top)
        }
    }
}

#Preview {
    ProfileView()
}
