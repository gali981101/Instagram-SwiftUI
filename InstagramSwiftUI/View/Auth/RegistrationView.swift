//
//  RegistrationView.swift
//  InstagramSwiftUI
//
//  Created by Terry Jason on 2026/1/2.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var fullname = ""
    @State private var username = ""
    @State private var password = ""
    
    @State private var selectedImage: UIImage?
    @State private var image: Image?
    
    @State var imagePickerPresented = false
    
    @Environment(\.presentationMode) var mode
    
    @FocusState private var focusedField: RegisterField?
    
    enum RegisterField {
        case email, username, fullname, password, confirmPassword
    }
    
    private let focusManager = FormFocusManager<RegisterField>(
        order: [
            .email,
            .username,
            .fullname,
            .password,
            .confirmPassword
        ]
    )
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(
                gradient: Gradient(colors: [Color(uiColor: .magenta), .red]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                ZStack {
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .clipShape(Circle())
                    } else {
                        Image("plus_photo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .foregroundColor(.white)
                    }
                    
                    Button(action: { imagePickerPresented.toggle() }) {
                        Color.clear
                            .frame(width: 140, height: 140)
                    }
                    .sheet(
                        isPresented: $imagePickerPresented,
                        onDismiss: loadImage,
                        content: { ImagePicker(image: $selectedImage) }
                    )
                }
                .padding()
                
                VStack(spacing: 20) {
                    CustomTextField(
                        text: $email,
                        placeholder: Text("メール"),
                        imageName: "envelope"
                    )
                    .authFieldStyle()
                    .focused($focusedField, equals: .email)
                    .submitLabel(.next)
                    
                    CustomTextField(
                        text: $username,
                        placeholder: Text("ユーザーネーム"),
                        imageName: "person"
                    )
                    .authFieldStyle()
                    .focused($focusedField, equals: .username)
                    .submitLabel(.next)
                    
                    CustomTextField(
                        text: $fullname,
                        placeholder: Text("フルネーム"),
                        imageName: "person"
                    )
                    .authFieldStyle()
                    .focused($focusedField, equals: .fullname)
                    .submitLabel(.next)
                    
                    CustomSecureField(
                        text: $password,
                        placeholder: Text("パスワード")
                    )
                    .authFieldStyle()
                    .focused($focusedField, equals: .password)
                    .submitLabel(.done)
                }
                
                Button(action: {}, label: {
                    Text("登録する")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(Color.black)
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

extension RegistrationView {
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        image = Image(uiImage: selectedImage)
    }
}

#Preview {
    RegistrationView()
}
