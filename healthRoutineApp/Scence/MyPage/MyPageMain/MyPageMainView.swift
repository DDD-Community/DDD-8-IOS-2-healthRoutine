//
//  MyPageMainView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/23.
//

import SwiftUI

struct MyPageMainView: View {
    
    var body: some View {
        
        ZStack {
            
            CustomNavigationView {
                
                BaseView {
                    
                    VStack {
                        
                        ScrollView(showsIndicators: false) {
                            
                            VStack(spacing: 16) {
                                
                                MyPageProfileView() // 프로필 변경
                                MyPageBadgeView() // 배지
                                MyPageUtilsView() // 로그아웃, 회원탈퇴
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
