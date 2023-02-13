//
//  HomeBadgeRowView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/19.
//

import SwiftUI

struct HomeBadgeRowView: View {
    
    @ObservedObject private var viewModel = BadgeViewModel()
    
    var body: some View {
        
        HStack(spacing: 4) {
            
            if let latesteBadge = viewModel.latestBadge {
                
                Image(uiImage: latesteBadge.icon(with: true)!)
                    .resizable()
                    .frame(width: 90, height: 90)
                
            } else {
                
                Image("자물쇠")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)
            }
           
            VStack(spacing: 8) {
                
                Text(self.viewModel.latestBadge?.title ?? "나의 배지")
                    .font(Font.pretendard(.bold, size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color(hex: "F9F9F9"))
                
                Text(self.viewModel.latestBadge?.desc ?? "운동을 하여 배지를 획득해 보세요!")
                    .font(.system(size: 16, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color(hex: "FFFFFF"))
            }
        }
        .padding(17) // 이미지 자체 패딩으로 인한 24 -> 17 (Figma)
        .frame(maxWidth: .infinity, maxHeight: 120, alignment: .leading)
        .background(Color.box_color)
        .cornerRadius(10)
        .onAppear { self.viewModel.fetchLatestBadgeInfo() }
    }
}

struct HomeBadgeRowView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBadgeRowView()
    }
}

