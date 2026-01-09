//
//  TextArea.swift
//  InstagramSwiftUI
//
//  Created by Terry Jason on 2026/1/1.
//

import SwiftUI

struct TextArea: View {
    
    @Binding var text: String
    
    var maxCount: Int = 2200
    var placeholder: String
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 4) {
            
            ZStack(alignment: .topLeading) {
                
                IGTextView(
                    text: $text,
                    maxCount: maxCount
                )
                .frame(height: 180)
                
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 10)
                        .allowsHitTesting(false)
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
            )
            
            Text("\(text.count)/\(maxCount)")
                .font(.caption)
                .foregroundColor(text.count >= maxCount ? .red : .gray)
        }
    }
}



#Preview {
    TextArea(
        text: .constant("セックスしたい."),
        placeholder: "キャプションを追加…"
    )
}
