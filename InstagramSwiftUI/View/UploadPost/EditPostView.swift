//
//  EditPostView.swift
//  InstagramSwiftUI
//
//  Created by Terry Jason on 2026/1/4.
//

import SwiftUI

struct EditPostView: View {
    
    let image: Image
    
    private let maxLength = 2200
    
    @State var caption: String
    
    @Environment(\.dismiss) private var dismiss
    
    @FocusState private var isEditing: Bool
    
    var remainingCount: Int {
        maxLength - caption.count
    }
    
    var body: some View {
        
        NavigationStack {
            ScrollViewReader { proxy in
                ScrollView {
                    
                    VStack(spacing: 0) {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .frame(height: 320)
                            .background(Color.black)        

                        // MARK: - 編輯區
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            ZStack(alignment: .topLeading) {
                                
                                TextEditor(text: $caption)
                                    .focused($isEditing)
                                    .font(.system(size: 15))
                                    .frame(minHeight: 160)
                                    .id("EDITOR")
                                    .onChange(of: caption) { _, newValue in
                                        if newValue.count > maxLength {
                                            caption = String(newValue.prefix(maxLength))
                                        }
                                    }
                                
                                if caption.isEmpty {
                                    Text("キャプションを入力…")
                                        .font(.system(size: 15))
                                        .foregroundColor(.gray)
                                        .padding(.top, 8)
                                        .padding(.leading, 4)
                                }
                            }
                            
                            HStack {
                                Spacer()
                                Text("\(remainingCount)")
                                    .font(.system(size: 13))
                                    .foregroundColor(
                                        remainingCount < 0 ? .red : .gray
                                    )
                            }
                        }
                        .padding()
                    }
                }
                .onChange(of: isEditing) { _, editing in
                    if editing {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                            withAnimation {
                                proxy.scrollTo("EDITOR", anchor: .bottom)
                            }
                        }
                    }
                }
            }
            
            .scrollDismissesKeyboard(.interactively)
            .navigationTitle("投稿を編集")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("完了") {
                        dismiss()
                    }
                    .fontWeight(.semibold)
                    .disabled(caption.isEmpty)
                }
            }
        }
    }
}


#Preview {
    EditPostView(
        image: Image("深田"),
        caption: "日本27歲AV女優深田詠美相當善於行銷自己，在社群平台經營得有聲有色，不時更製造出轟動話題，IG、YouTube皆破百萬追蹤，X（原Twitter）更是擁有300萬粉絲，曾被視為新一代的「AV女神」，然而從2022年底開始，深田詠美就未推出任何AV作品。雖然在社交媒體上一直相當活躍，然而卻遭揣測是否引退，而熟悉成人圈的人士也分析可能原因。深田詠美自2022年12月至今AV作品停擺，近3年未推出任何AV作品，動作相當不尋常，深田詠美也曾緊急開直播鄭重宣佈：「我沒有引退，也不打算那麼做（退休）。」對於外界的猜測，她表示自己和公司之間有一些問題需要解決。"
    )
}
