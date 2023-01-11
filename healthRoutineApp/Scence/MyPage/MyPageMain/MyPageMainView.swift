//
//  MyPageMainView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/23.
//

import SwiftUI

struct MyPageMainView: View {
    
    var body: some View {
        
        CustomNavigationView {
            
            VStack {
                
                ScrollView(showsIndicators: false) {
                    
                    VStack(alignment: .center) {
                        
                        MyPageProfileView()
                        MyPageHistoryView()
                        MyPageBadgeView()
                        
                        HStack(spacing: 70) {
                            
                            Text("로그아웃")
                                .font(Font.pretendard(.medium, size: 14))
                                .foregroundColor(Color(hex: "707070"))
                            
                            Text("회원탈퇴")
                                .font(Font.pretendard(.medium, size: 14))
                                .foregroundColor(Color(hex: "707070"))
                        }
                        .padding(.top, 16)
                    }
                }
                
            }.customNavigationBarBackButtonHidden(true)
        }
        
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageMainView()
    }
}
