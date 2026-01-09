//
//  UserCell.swift
//  InstagramSwiftUI
//
//  Created by Terry Jason on 2025/12/24.
//

import SwiftUI

struct UserCell: View {
    
    var body: some View {
        HStack {
            Image("深田")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text("深田")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("深田えいみ")
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}

#Preview {
    UserCell()
}
