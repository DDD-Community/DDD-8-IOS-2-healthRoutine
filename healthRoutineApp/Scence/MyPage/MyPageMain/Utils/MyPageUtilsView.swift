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
    
    @ObservedObject private var viewModel = MyPageUtilsViewModel()
    @EnvironmentObject private var viewRouter: ViewRouter
    
    var body: some View {
      
        VStack {
            
            Button {
                
                self.viewModel.signOutFinished.send(true)
                
            } label: {
                
                Text("로그아웃")
                    .frame(maxWidth: .infinity, minHeight: 60)
                    .font(Font.pretendard(.medium, size: 18))
                    .foregroundColor(.white)
                    .background(Color(hex: "4B4C55"))
                    .cornerRadius(10)
            }
//            .toast(isShowing: $showToast, text: "로그아웃 되었습니다.")
            
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
                    
                    self.viewModel.withDraw()
                    
                }, cancelCompletion: {
                    
                    self.isPresented.toggle()
                }))
                .background(ClearBackgroundView())
            }
        }
        .onAppear {
            
            self.viewModel.signOutFinished
                .receive(on: RunLoop.main)
                .sink(receiveValue: {
                    self.showToast = $0
                    self.viewModel.showToastView.send($0)
                })
                .store(in: &self.viewModel.cancellables)
            
            self.viewModel.withdrawFinished
                .receive(on: RunLoop.main)
                .sink(receiveValue: { _ in
                    
                    viewRouter.changeFlag.toggle()
                    viewRouter.currentView = .account
                    
                    self.viewModel.deletAccessToken.send(true)
                })
                .store(in: &self.viewModel.cancellables)
            
            self.viewModel.showToastView
                .delay(for: .seconds(1), scheduler: DispatchQueue.main)
                .receive(on: RunLoop.main)
                .sink(receiveValue: { _ in
                    
                    // TODO: Access Token Delete -> 테스트 위해 화면 이동만 처리
                    viewRouter.changeFlag.toggle()
                    viewRouter.currentView = .account
                })
                .store(in: &self.viewModel.cancellables)
            
            self.viewModel.deletAccessToken
                .delay(for: .seconds(1), scheduler: DispatchQueue.main)
                .sink(receiveValue: { _ in KeychainService.shared.deleteToken() })
                .store(in: &self.viewModel.cancellables)
        }
        .toast(isShowing: $showToast, text: "로그아웃 되었습니다.")
    }
}

struct MyPageUtilsView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageUtilsView()
    }
}
