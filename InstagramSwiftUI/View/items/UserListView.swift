//
//  UserListView.swift
//  InstagramSwiftUI
//
//  Created by Terry Jason on 2025/12/24.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<20) { _ in
                    NavigationLink {
                        ProfileView()
                    } label: {
                        UserCell()
                            .padding(.leading)
                    }
                }
            }
        }
    }
}

#Preview {
    UserListView()
}
