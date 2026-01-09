//
//  LoginView.swift
//  InstagramSwiftUI
//
//  Created by Terry Jason on 2026/1/2.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    @FocusState private var focusedField: LoginField?
    
    enum LoginField {
        case email, password
    }
    
    private let focusManager = FormFocusManager<LoginField>(
        order: [.email, .password]
    )
    
    var body: some View {
        
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.pink, Color(uiColor: .magenta)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack {
                    Image("Instagram_logo_white")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220, height: 100)
                        .padding(.top, 20)
                    
                    VStack(spacing: 20) {
                        CustomTextField(
                            text: $email,
                            placeholder: Text("メール"),
                            imageName: "envelope"
                        )
                        .authFieldStyle()
                        .focused($focusedField, equals: .email)
                        .submitLabel(.next)
                        
                        CustomSecureField(
                            text: $password,
                            placeholder: Text("パスワード")
                        )
                        .authFieldStyle()
                        .focused($focusedField, equals: .password)
                        .submitLabel(.done)
                    }
                    
                    HStack {
                        Spacer()
                        
                        NavigationLink(
                            destination: ResetPasswordView(email: $email),
                            label: {
                                Text("パスワードを忘れた場合")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.white)
                                    .padding(.top)
                                    .padding(.trailing, 28)
                            })
                    }
                    
                    Button(action: {}, label: {
                        Text("ログイン")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 50)
                            .background(Color.black)
                            .clipShape(Capsule())
                            .padding()
                    })
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: RegistrationView().navigationBarHidden(true),
                        label: {
                            HStack {
                                Text("アカウントをお持ちでないですか？")
                                    .font(.system(size: 14))
                                
                                Text("登録する")
                                    .font(.system(size: 14, weight: .semibold))
                            }.foregroundColor(.white)
                        }
                    )
                    .padding(.bottom, 16)
                }
                .padding(.top, 40)
            }
            .onSubmit {
                if let next = focusManager.next(after: focusedField) {
                    focusedField = next
                } else {
                    focusedField = nil
                }
            }
            .dismissKeyboardOnTap()
        }
    }
}

#Preview {
    LoginView()
}
