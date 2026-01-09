//
//  View+Utils.swift
//  InstagramSwiftUI
//
//  Created by Terry Jason on 2026/1/4.
//

import SwiftUI

extension View {
    
    func dismissKeyboardOnTap() -> some View {
        modifier(DismissKeyboardOnTap())
    }
    
    func authFieldStyle() -> some View {
        modifier(AuthFieldStyle())
    }
    
    func buttonTextStyle(background: Color) -> some View {
        modifier(ButtonTextStyle(backgroundColor: background))
    }
    
    func igButtonStyle(background: Color, foreground: Color) -> some View {
        modifier(IGButtonStyle(backgroundColor: background, foregroundColor: foreground))
    }
}

