//
//  SearchView.swift
//  InstagramSwiftUI
//
//  Created by Terry Jason on 2025/12/22.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    @State var inSearch: Bool = false
    
    var body: some View {
        
        ScrollView {
            SearchBar(
                text: $searchText,
                isEditing: $inSearch
            )
                .padding()
            
            ZStack {
                if inSearch {
                    UserListView()
                } else {
                    PostGridView()
                }
            }
        }
    }
}

#Preview {
    SearchView()
}
