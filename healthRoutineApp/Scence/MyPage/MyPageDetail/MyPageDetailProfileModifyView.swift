//
//  MyPageDetailProfileModifyView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/22.
//

import SwiftUI

struct MyPageDetailProfileModifyView: View {
    
    @State var showActionSheet: Bool = false
    @State var showImagePicker: Bool = false
    
    @ObservedObject var viewModel = MyPageDetailModifyViewModel()
    
    @State var image: UIImage = UIImage()
    
    var body: some View {
        
        VStack(spacing: 24) {
            
            Image("ProfileDefault")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.red)
                .frame(width: 132, height: 132)
                .clipShape(Circle())
                .overlay(            Image("camera")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .offset(x: 50, y:50) )
                .onTapGesture {
                    self.showActionSheet = true
                }
            
            MyPageDetailInputView(value: $viewModel.nickname)
        }
        .padding(.horizontal, 20)
        .actionSheet(isPresented: $showActionSheet, content: actionSheet)
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(sourceType: .photoLibrary) { self.image = $0 }
        }
    }
    
    private func actionSheet() -> ActionSheet {
        
        let albumButton = ActionSheet.Button.default(Text("앨범에서 선택하기")) {
            self.showImagePicker = true
        }
        let defaultButton = ActionSheet.Button.default(Text("기본 프로필 사진으로 변경하기"))
        let cancelButton = ActionSheet.Button.cancel(Text("닫기"))
        let destructiveButton = ActionSheet.Button.destructive(Text("프로필 사진 삭제"))
        let actionSheet = ActionSheet(title: Text("선택해주세요"),
                                      message: Text("앨범을 선택해주세요"),
                                      buttons: [albumButton, defaultButton, destructiveButton, cancelButton])
        return actionSheet
    }
}

struct MyPageDetailInputView: View {
    
    @Binding var value: String
    
    var body: some View {
        
        VStack {
            
            TextField("닉네임을 입력해 주세요.", text: $value)
                .textFieldStyle(DefaultTextFieldStyle())
            
            HStack {
                TextField("Search...", text: $value)
                    .foregroundColor(.cyan)
            }
            .textFieldStyle(DefaultTextFieldStyle())
            
            Divider()
        }
    }
}

struct MyPageDetailProfileModifyView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageDetailProfileModifyView(showActionSheet: false, showImagePicker: false)
            .background(Color.box_color)
    }
}
