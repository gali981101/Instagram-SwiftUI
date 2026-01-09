//
//  ResetPasswordView.swift
//  InstagramSwiftUI
//
//  Created by Terry Jason on 2026/1/2.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @Environment(\.presentationMode) var mode
    @Binding private var email: String
    
    init(email: Binding<String>) {
        self._email = email
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(uiColor: .magenta), .pink]),
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack {
                Image("instagram_logo_white")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                    .foregroundColor(.white)
                
                VStack(spacing: 20) {
                    CustomTextField(
                        text: $email,
                        placeholder: Text("メール"),
                        imageName: "envelope"
                    )
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .padding(.horizontal, 32)
                }
                
                Button(action: {}, label: {
                    Text("再設定リンクを送信")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(Color(uiColor: .black))
                        .clipShape(Capsule())
                        .padding()
                })
                
                Spacer()
                
                Button(action: { mode.wrappedValue.dismiss() }, label: {
                    HStack {
                        Text("すでにアカウントをお持ちですか？")
                            .font(.system(size: 14))
                        
                        Text("ログイン")
                            .font(.system(size: 14, weight: .semibold))
                    }.foregroundColor(.white)
                })
            }
            .padding(.top, -44)
        }
        .dismissKeyboardOnTap()
    }
}


