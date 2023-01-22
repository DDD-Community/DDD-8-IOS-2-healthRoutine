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
    
    var badgeTest: Badge = .water
    
    var body: some View {
        
        LazyVStack {
            
            HStack(spacing: 16) {
                
                Image(badgeTest.icon)
                    .resizable()
                    .frame(width: 66, height: 66)
                    .aspectRatio(1, contentMode: .fit)
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text(badgeTest.title)
                        .font(Font.pretendard(.bold, size: 20))
                        .foregroundColor(.white)
                    
                    Text("수분 섭취 목표 2달 달성")
                        .font(Font.pretendard(.semiBold, size: 14))
                        .foregroundColor(.white)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            LazyVGrid(columns: columns) {
                
                // Sample Data
                ForEach(Badge.allCases, id: \.self) { // 뱃지 넣으면 될듯!
                    
                    Image($0.icon)
                        .resizable()
                        .frame(width: 80, height: 80)
                }
            }
        }
        .padding(24)
//        .padding(.top, 24)
//        .padding(.bottom, 19)
        .frame(maxWidth: .infinity)
        .background(Color.box_color)
        .cornerRadius(10)
    }
}

struct MyPageBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageBadgeView()
    }
}