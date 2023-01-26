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
    
    var body: some View {
        
        ZStack {
            
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
                                .padding(.vertical, 16)
                            }
                        }
                    }
                    .customNavigationBarBackButtonHidden(true)
                    .customNavigationTitle("마이페이지")
                    
                }
                
            }
            
//            ZStack {
//
//                Text("")
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .background(.black)
//                    .opacity(0.4)
//                    .edgesIgnoringSafeArea(.all)
//
//                MyPageBadgeDetailView()
//                    .edgesIgnoringSafeArea(.all)
//            }
//            .onTapGesture {
//                debugPrint("Close Badge Detail")
//            }
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageMainView()
    }
}
