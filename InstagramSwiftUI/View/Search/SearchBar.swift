//
//  SearchBar.swift
//  InstagramSwiftUI
//
//  Created by Terry Jason on 2025/12/24.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @Binding var isEditing: Bool
    
    var body: some View {
        HStack {
            TextField("検索...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                            .frame(
                                minWidth: 0,
                                maxWidth: .infinity,
                                alignment: .leading
                            )
                            .padding(.leading, 8)
                    }
                }
                .simultaneousGesture(TapGesture().onEnded {
                    isEditing = true
                })
            
            if isEditing {
                Button(action: {
                    isEditing = false
                    text = ""
                    UIApplication.shared.endEditing()
                }) {
                    Text("キャンセル")
                }
                .padding(.trailing, 8)
                .tint(Color(uiColor: .label))
            }
        }
    }
}

#Preview {
    SearchBar(
        text: .constant("検索..."),
        isEditing: .constant(true)
    )
}
