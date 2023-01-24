//
//  MyPageProfileView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/23.
//

import SwiftUI

struct MyPageProfileView: View {
    
    @StateObject private var viewModel = MyPageViewModel()
    
    var body: some View {
        
        VStack {
            
            HStack(spacing: 22) {
                
                if let profileImage = viewModel.recentImage {
                    
                    Image(uiImage: profileImage)
                        .resizable()
                        .frame(width: 66, height: 66)
                        .scaledToFit()
                        .clipShape(Circle())
                    
                } else {
                    
                    Image("profile")
                        .resizable()
                        .frame(width: 66, height: 66)
                        .scaledToFit()
                        .clipShape(Circle())
                    
                }
                
                Text(self.viewModel.nickname)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.pretendard(.bold, size: 20))
                    .foregroundColor(.white)
                
                Spacer()
            }
            
            Spacer()
            
            CustomNavigationLink(destination: MyPageProfileDetailView().customNavigationTitle("닉네임 수정")
            ) {
                Text("프로필 수정")
                    .frame(maxWidth: .infinity, minHeight: 46)
                    .font(.system(size: 18, weight: .bold))
                    .background(Color(hex: "4B4C55"))
                    .foregroundColor(Color.disabled_button_field)
                    .cornerRadius(10)
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: 176)
        .background(Color.box_color)
        .cornerRadius(10)
        .onAppear {
            self.viewModel.fetchProfile()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageProfileView()
    }
}
