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
        
        VStack {
            
            HStack(spacing: 16) {
                
                Image(badgeTest.icon)
                    .resizable()
                    .frame(width: 66, height: 66)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text(badgeTest.title)
                        .font(Font.pretendard(.bold, size: 20))
                        .foregroundColor(.white)
                    
                    Text("수분 섭취 목표 2달 달성")
                        .font(Font.pretendard(.semiBold, size: 14))
                        .foregroundColor(.white)
                }
            }
            .padding(.bottom, 27)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            LazyVGrid(columns: columns, spacing: 16) {
                
                // Sample Data
                ForEach(Badge.allCases, id: \.self) { // 뱃지 넣으면 될듯!
                    
                    Image($0.icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .frame(maxWidth: .infinity)
//                        .background(.red)
                }
            }
            .frame(maxWidth: .infinity)
//            .background(.red)
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: 280)
        .background(Color.box_color)
        .cornerRadius(10)
    }
}

struct MyPageBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageBadgeView()
    }
}
