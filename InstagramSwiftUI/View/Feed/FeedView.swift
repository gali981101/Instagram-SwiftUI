//
//  FeedView.swift
//  InstagramSwiftUI
//
//  Created by Terry Jason on 2025/12/22.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject var viewModel = FeedViewModel()
    
    @State private var goToEdit = false
    @State private var selectedPostImage: Image = Image("photo5")
    @State private var selectedPostCaption: String = "水泳が大好きです！新しい作品を応援してください！"
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(0..<100) { _ in
                        FeedCell(
                            postImage: selectedPostImage,
                            postCaption: selectedPostCaption,
                            onEdit: {
                                goToEdit = true
                            }
                        )
                    }
                }
                .padding(.top)
            }
            
            .navigationDestination(isPresented: $goToEdit) {
                EditPostView(
                    image: selectedPostImage,
                    caption: selectedPostCaption
                )
            }
        }
    }
}

#Preview {
    FeedView()
}
