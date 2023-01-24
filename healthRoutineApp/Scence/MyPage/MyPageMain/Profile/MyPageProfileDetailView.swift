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
            
            VStack(spacing: 16) {
                
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
                                        .frame(width: 40, height: 40)
                                        .offset(x: 45, y: 45))
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
                
                Text("프로필 수정")
                    .frame(maxWidth: .infinity, minHeight: 60)
                    .font(Font.pretendard(.bold, size: 18))
                    .background(Color(hex: "3CF4B2"))
                    .cornerRadius(10)
                    .onTapGesture {
                        self.viewModel.updateProfileImage()
                        debugPrint("수정하기")
                    }
                
                Spacer()
            }
            .onAppear {
                self.bindView()
            }
        }
    }
    
    private func bindView() {
        
        self.viewModel.updateProfileFinished
            .receive(on: RunLoop.main)
            .sink(receiveValue: { _ in self.viewModel.updateUserInfo() })
            .store(in: &self.viewModel.cancellables)
        
        self.viewModel.updateFinished
            .receive(on: RunLoop.main)
            .sink(receiveValue: { _ in self.presentationMode.wrappedValue.dismiss() })
            .store(in: &self.viewModel.cancellables)
    }
}

struct MyPageProfileDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageProfileDetailView()
    }
}
