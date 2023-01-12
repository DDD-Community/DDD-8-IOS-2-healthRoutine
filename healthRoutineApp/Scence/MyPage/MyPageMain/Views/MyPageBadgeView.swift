//
//  MyPageBadgeView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/23.
//

import SwiftUI

struct MyPageBadgeView: View {
    
    private let columns = [
        GridItem(.flexible()),GridItem(.flexible()),
        GridItem(.flexible()),GridItem(.flexible())
    ]
    
    var body: some View {
        
        VStack {
            
            HStack(spacing: 16) {
                
                Image("ProfileDefault")
                    .resizable()
                    .frame(width: 66, height: 66)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text("물 먹는 슈퍼 하마왕")
                        .font(Font.pretendard(.bold, size: 20))
                        .foregroundColor(.white)
                    
                    Text("수분 섭취 목표 2달 달성")
                        .font(Font.pretendard(.semiBold, size: 14))
                        .foregroundColor(.white)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            HStack(spacing: 20) {

                Image("ProfileDefault")
                    .resizable()
                    .frame(width: 66, height: 66)
                    .clipShape(Circle())

                Image("ProfileDefault")
                    .resizable()
                    .frame(width: 66, height: 66)
                    .clipShape(Circle())

                Image("ProfileDefault")
                    .resizable()
                    .frame(width: 66, height: 66)
                    .clipShape(Circle())

                Image("ProfileDefault")
                    .resizable()
                    .frame(width: 66, height: 66)
                    .clipShape(Circle())
            }
            
            HStack(spacing: 20) {

                Image("ProfileDefault")
                    .resizable()
                    .frame(width: 66, height: 66)
                    .clipShape(Circle())

                Image("ProfileDefault")
                    .resizable()
                    .frame(width: 66, height: 66)
                    .clipShape(Circle())

                Image("ProfileDefault")
                    .resizable()
                    .frame(width: 66, height: 66)
                    .clipShape(Circle())

                Image("ProfileDefault")
                    .resizable()
                    .frame(width: 66, height: 66)
                    .clipShape(Circle())
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: 268)
        .background(Color.box_color)
        .cornerRadius(10)
    }
}

struct MyPageBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageBadgeView()
    }
}
