//
//  MyPageMainView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/23.
//

import SwiftUI

struct MyPageMainView: View {
    
    @ObservedObject private var viewModel = MyPageViewModel()
    @EnvironmentObject private var viewRouter: ViewRouter
    @State private var isPresented = false
    
//    private let signOutInfo: AlertorViewInfo
    
    var body: some View {
        
        ZStack {
            
            CustomNavigationView {
                
                BaseView {
                    
                    VStack {
                        
                        ScrollView(showsIndicators: false) {
                            
                            VStack(spacing: 16) {
                                
                                MyPageProfileView()
                                MyPageBadgeView()
                                
                                Button {
                                    self.isPresented.toggle()
                                } label: {
                                    Text("로그아웃")
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
                                .onAppear {
                                    UIView.setAnimationsEnabled(false)
                                }
                                
                                Button {
                                    self.isPresented.toggle()
                                    
                                    //                                        viewModel.logout() {
                                    //                                            viewRouter.currentView = .account
                                    //                                            viewRouter.changeFlag.toggle()
                                    //                                        }
                                } label: {
                                    Text("회원탈퇴")
                                        .frame(maxWidth: .infinity, minHeight: 60)
                                        .font(Font.pretendard(.medium, size: 18))
                                        .foregroundColor(.white)
                                        .background(Color(hex: "4B4C55"))
                                        .cornerRadius(10)
                                }
                                .fullScreenCover(isPresented: $isPresented) {
                                    CommonAlertView(info: AlertorViewInfo(title: "", message: "", okTitle: "", cancelTitle: "", okCompletion: nil, cancelCompletion: nil))
                                        .background(ClearBackgroundView())
                                }
                                .onAppear {
                                    UIView.setAnimationsEnabled(false)
                                }
                            }
                        }
                    }
                    .customNavigationBarBackButtonHidden(true)
                    .customNavigationTitle("마이페이지")
                }
            }
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageMainView()
    }
}
