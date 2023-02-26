//
//  MyPageUtilsView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/31.
//

import SwiftUI

struct MyPageUtilsView: View {
    
    @State var isPresented: Bool = false
    @State var showToast: Bool = false
    
    var body: some View {
      
        VStack {
            
            Button {
                
                self.showToast = true
                
//                viewModel.logout() {
//                    viewRouter.currentView = .account
//                    viewRouter.changeFlag.toggle()
//                }
                
            } label: {
                
                Text("로그아웃")
                    .frame(maxWidth: .infinity, minHeight: 60)
                    .font(Font.pretendard(.medium, size: 18))
                    .foregroundColor(.white)
                    .background(Color(hex: "4B4C55"))
                    .cornerRadius(10)
            }
            .toast(isShowing: $showToast, text: "로그아웃 되었습니다.")
            
            Button {
                
                self.isPresented.toggle()
          
            } label: {
                
                Text("회원탈퇴")
                    .frame(maxWidth: .infinity, minHeight: 60)
                    .font(Font.pretendard(.medium, size: 18))
                    .foregroundColor(.white)
                    .background(Color(hex: "4B4C55"))
                    .cornerRadius(10)
            }
            .fullScreenCover(isPresented: $isPresented) {
                
                CommonAlertView(info: AlertorViewInfo(title: "회원탈퇴", message: "정말 우리를 떠나실건가요?\n탈퇴 후 회원 정보는 복구가 불가능해요.", okTitle: "탈퇴하기", cancelTitle: "취소", okCompletion: {
                    self.isPresented.toggle()
                }, cancelCompletion: {
                    self.isPresented.toggle()
                }))
                .background(ClearBackgroundView())
            }
            .onAppear { UIView.setAnimationsEnabled(false) }
        }
    }
}

struct MyPageUtilsView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageUtilsView()
    }
}
