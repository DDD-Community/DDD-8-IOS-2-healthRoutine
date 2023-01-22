//
//  MyPageDetailView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/22.
//

import SwiftUI

struct MyPageProfileDetailView: View {
    
    @ObservedObject var viewModel = MyPageViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        BaseView {
            
            VStack {
                
                VStack(spacing: 30) {
                    
                    Button(action: { viewModel.showActionSheet = true} ) {
                        
                        if let previewImage = viewModel.recentImage {
                            
                            Image(uiImage: previewImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 132, height: 132)
                                .clipShape(Circle())
                            
                        } else {
                            
                            Image("profile")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 132, height: 132)
                                .clipShape(Circle())
                                .overlay(
                                    Image("camera")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                        .offset(x: 50, y:50) )
                        }
                    }
                    
                    VStack(spacing: 6) {
                        
                        TextField("", text: $viewModel.nickname)
                            .placeholder(when: viewModel.nickname.isEmpty) {
                                Text("변경하실 닉네임을 입력해주세요.").foregroundColor(Color(hex: "C9C9C9"))
                            }
                            .foregroundColor(Color(hex: "FFFFFF"))
                        
                        Divider()
                            .background(Color(hex: "C9C9C9"))
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 24)
                .frame(maxWidth: .infinity)
                .background(Color.box_color)
                .cornerRadius(16)
                .actionSheet(isPresented: $viewModel.showActionSheet, content: viewModel.actionSheet)
                .sheet(isPresented: $viewModel.showImagePicker) {
                    ImagePicker(sourceType: .photoLibrary) {
                        self.viewModel.recentImage = $0
                    }
                }
                
                Button("수정 하기") {
                    self.presentationMode.wrappedValue.dismiss()
                }
                .background(Color(hex: "3CF4B2"))
                .buttonStyle(CommonButtonView())
                .cornerRadius(10)
                
                Spacer()
            }
        }
    }
}

struct MyPageProfileDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageProfileDetailView()
    }
}
