//
//  PostGridView.swift
//  InstagramSwiftUI
//
//  Created by Terry Jason on 2025/12/24.
//

import SwiftUI

struct PostGridView: View {
    
    let images = [
        "photo1",
        "photo2",
        "photo3",
        "photo4",
        "photo5",
        "photo6",
        "photo7",
        "photo8",
        "photo9",
        "photo10"
    ]
    
    private let columns = Array(
        repeating: GridItem(.flexible(), spacing: 1),
        count: 3
    )
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: columns, spacing: 1) {
                ForEach(images, id: \.self) { image in
                    NavigationLink {
                        FeedView()
                    } label: {
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: (UIWindow.current?.bounds.size.width ?? 0) / 3)
                            .clipped()
                    }
                    
                }
            }
        }
    }
}

#Preview {
    PostGridView()
}
