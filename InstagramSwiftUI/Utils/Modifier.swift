//
//  Modifier.swift
//  InstagramSwiftUI
//
//  Created by Terry Jason on 2026/1/4.
//

import SwiftUI

struct DismissKeyboardOnTap: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .contentShape(Rectangle())
            .onTapGesture {
                UIApplication.shared.sendAction(
                    #selector(UIResponder.resignFirstResponder),
                    to: nil,
                    from: nil,
                    for: nil
                )
            }
    }
}

struct AuthFieldStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(.init(white: 1, alpha: 0.15)))
            .cornerRadius(10)
            .foregroundColor(.white)
            .padding(.horizontal, 32)
    }
}

struct ButtonTextStyle: ViewModifier {
    
    var backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16, weight: .semibold))
            .frame(width: 172, height: 50)
            .background(backgroundColor)
            .cornerRadius(5)
            .foregroundColor(.white)
    }
}

struct IGButtonStyle: ViewModifier {
    
    var backgroundColor: Color
    var foregroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18))
            .frame(maxWidth: .infinity)
            .padding()
            .background(backgroundColor)
            .cornerRadius(10)
            .foregroundColor(foregroundColor)
    }
}


