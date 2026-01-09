//
//  UploadPostView.swift
//  InstagramSwiftUI
//
//  Created by Terry Jason on 2025/12/22.
//

import SwiftUI

struct UploadPostView: View {
    
    @State var postImage: Image?
    @State var captionText: String = ""
    @State var imagePickerPresented = false
    
    @State private var selectedImage: UIImage?
    @State private var showDiscardAlert = false
    
    @FocusState private var isCaptionFocused: Bool
    
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack {
            if postImage == nil {
                Button(action: {
                    imagePickerPresented.toggle()
                }, label: {
                    VStack {
                        Image(systemName: "plus").font(.title).padding(.bottom, 4)
                        Text("Photo").font(.headline)
                    }
                })
                .padding(30)
                .foregroundColor(Color(uiColor: .label))
                .overlay(
                    Circle()
                        .stroke(Color(uiColor: .label), lineWidth: 2)
                )
                .padding()
                .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedImage)
                })
            } else if let image = postImage {
                HStack(alignment: .top) {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 200)
                        .clipped()
                    
                    TextArea(text: $captionText, placeholder: "キャプションを追加…")
                        .frame(height: 200)
                        .focused($isCaptionFocused)
                }
                .padding()
                
                HStack(spacing: 16) {
                    Button(action: {
                        showDiscardAlert = true
                    }, label: {
                        Text("破棄")
                            .buttonTextStyle(background: .pink)
                    })
                    .alert("投稿を破棄しますか？", isPresented: $showDiscardAlert) {
                        Button("破棄", role: .destructive) {
                            captionText = ""
                            postImage = nil
                        }
                        Button("キャンセル", role: .cancel) {}
                    }
                    
                    Button(action: {
                        if let image = selectedImage {
                            print(image)
                        }
                    }, label: {
                        Text("シェア")
                            .buttonTextStyle(background: .black)
                    })
                }.padding()
            }
            
            Spacer()
        }
        .contentShape(Rectangle())
        .onTapGesture {
            isCaptionFocused = false
        }
    }
}

extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}

#Preview {
    UploadPostView(tabIndex: .constant(1))
}
