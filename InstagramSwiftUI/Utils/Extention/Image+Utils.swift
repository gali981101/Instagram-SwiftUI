//
//  Image+Utils.swift
//  InstagramSwiftUI
//
//  Created by Terry Jason on 2026/1/4.
//

import SwiftUI

extension Image {
    
    func actionIconStyle() -> some View {
        self
            .resizable()
            .scaledToFill()
            .frame(width: 20, height: 20)
            .padding(4)
    }
}
