//
//  FeedViewModel.swift
//  InstagramSwiftUI
//
//  Created by Terry Jason on 2025/12/23.
//

import Combine

final class FeedViewModel: ObservableObject {
    
    @Published var posts: [Post] = []
}
