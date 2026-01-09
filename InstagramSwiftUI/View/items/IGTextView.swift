//
//  IGTextView.swift
//  InstagramSwiftUI
//
//  Created by Terry Jason on 2026/1/2.
//

import UIKit
import SwiftUI

struct IGTextView: UIViewRepresentable {
    
    @Binding var text: String
    
    let maxCount: Int
    
    func makeUIView(context: Context) -> UITextView {
        let tv = UITextView()
        
        tv.font = .systemFont(ofSize: 17)
        tv.isScrollEnabled = true
        tv.backgroundColor = .clear
        tv.textContainerInset = UIEdgeInsets(top: 8, left: 4, bottom: 8, right: 4)
        tv.delegate = context.coordinator
        tv.tintColor = UIColor.label
        
        return tv
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        
        if uiView.text != text {
            uiView.text = text
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        
        let parent: IGTextView
        
        init(_ parent: IGTextView) {
            self.parent = parent
        }
        
        func textViewDidChange(_ textView: UITextView) {
            
            if textView.text.count > parent.maxCount {
                textView.text = String(textView.text.prefix(parent.maxCount))
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
            
            parent.text = textView.text
            
            let range = NSMakeRange(textView.text.count - 1, 1)
            textView.scrollRangeToVisible(range)
        }
    }
}

