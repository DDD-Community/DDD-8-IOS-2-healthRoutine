//
//  MyPageProfileView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/23.
//

import SwiftUI

struct MyPageProfileView: View {
    
    var body: some View {
        
        VStack {
            
            HStack(spacing: 22) {
                
                Image("profile")
                    .resizable()
                    .frame(width: 66, height: 66)
                    .scaledToFit()
                    .clipShape(Circle())
                    
                Text("햄스터 갱스터")
                    .font(Font.pretendard(.bold, size: 20))
                    .foregroundColor(.white)
                
                Spacer()
            }
            
            CustomNavigationLink(destination: MyPageDetailView().customNavigationTitle("닉네임 수정")
            ) {
                Text("프로필 수정")
                    .frame(maxWidth: .infinity, minHeight: 46)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color(hex: "4B4C55"))
                    .background(Color.disabled_button_field)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: 176)
        .background(Color.box_color)
        .cornerRadius(10)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageProfileView()
    }
}
