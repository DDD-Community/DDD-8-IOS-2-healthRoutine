//
//  MyPageDetailProfileModifyView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/22.
//

import SwiftUI

struct MyPageDetailProfileModifyView: View {
    
    @ObservedObject var viewModel = MyPageDetailProfileModifyViewModel()
    
    @State var showActionSheet: Bool = false
    @State var showAlbum: Bool = false
    
    var body: some View {
        
        VStack(spacing: 15) {
            
            Circle()
                .fill(Color.blue)
                .frame(width: 132, height: 132)
                .overlay(Rectangle().frame(width: 30, height: 30).offset(x: 50, y:50) )
                .onTapGesture {
                    self.showActionSheet = true
                }
            
            MyPageDetailInputView(value: $viewModel.nickname)
        }
        .padding(.horizontal, 20)
        .actionSheet(isPresented: $showActionSheet, content: actionSheet)
    }
    
    private func actionSheet() -> ActionSheet {
        
        let albumButton = ActionSheet.Button.default(Text("앨범에서 선택하기")) {
            
            UIView.setAnimationsEnabled(false)
            
            self.showActionSheet = false
            self.showAlbum = true
        }
        
        let defaultButton = ActionSheet.Button.default(Text("기본 프로필 사진으로 변경하기")) {
            
            UIView.setAnimationsEnabled(false)
            
            self.showActionSheet = false
        }
                
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
            Divider()
        }
    }
}


struct MyPageDetailProfileModifyView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageDetailProfileModifyView(showActionSheet: false, showAlbum: false)
    }
}
