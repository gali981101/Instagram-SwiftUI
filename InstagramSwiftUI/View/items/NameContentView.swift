//
//  NameContentView.swift
//  InstagramSwiftUI
//
//  Created by Terry Jason on 2026/1/4.
//

import SwiftUI

struct NameContentView: View {
    
    let name: String
    let content: String
    
    var nameColor: Color = .primary
    var contentColor: Color = .primary
    var contentFont: Font = .system(size: 15)
    var nameFont: Font = .system(size: 15, weight: .semibold)
    
    @Binding var expanded: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(attributedText)
                .multilineTextAlignment(.leading)
                .lineSpacing(4)
                .lineLimit(expanded ? nil : 2)
                .padding(.horizontal, 8)
            
            if needsTruncation {
                Button(action: { expanded.toggle() }) {
                    Text(expanded ? "閉じる" : "...続きを読む")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color(uiColor: .label))
                        .padding(.horizontal, 8)
                        .padding(.top, 2)
                }
                .buttonStyle(.plain)
            }
        }
    }
    
    private var attributedText: AttributedString {
        
        var combined = AttributedString(name + content)
        
        if let range = combined.range(of: name) {
            combined[range].font = nameFont
            combined[range].foregroundColor = nameColor
        }
        
        if let range = combined.range(of: content) {
            combined[range].font = contentFont
            combined[range].foregroundColor = contentColor
        }
        
        return combined
    }
    
    private var needsTruncation: Bool {
        let approxCharsPerLine = 40
        return content.count > approxCharsPerLine * 2
    }
}


