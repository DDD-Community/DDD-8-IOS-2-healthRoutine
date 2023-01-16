//
//  MyPageMainView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/23.
//

import SwiftUI

struct MyPageMainView: View {
    @ObservedObject private var viewModel = MyPageDetailViewModel()
    @EnvironmentObject private var viewRouter: ViewRouter

    private var badge: Badge = .badge1
    
    var body: some View {
        
        CustomNavigationView {
            
            BaseView {
                
                VStack {
                    
                    ScrollView(showsIndicators: false) {
                        
                        VStack(spacing: 16) {
                            
                            MyPageProfileView()
                            MyPageHistoryView()
                            MyPageBadgeView()
                            
                            HStack(spacing: 70) {

                                Button {
                                    viewModel.logout() {
                                        viewRouter.currentView = .account
                                        viewRouter.changeFlag.toggle()
                                    }
                                } label: {
                                    Text("로그아웃")
                                        .font(Font.pretendard(.medium, size: 14))
                                        .foregroundColor(Color(hex: "707070"))
                                }
                                
                                Text("회원탈퇴")
                                    .font(Font.pretendard(.medium, size: 14))
                                    .foregroundColor(Color(hex: "707070"))
                            }
                            .padding(.top, 16)
                        }
                
                    }
                }
                .customNavigationBarBackButtonHidden(true)
                .customNavigationTitle("마이페이지")
            }
        }
    }
    
    private func bindView() {
        
        self.viewModel.fetchInfo()
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageMainView()
    }
}
