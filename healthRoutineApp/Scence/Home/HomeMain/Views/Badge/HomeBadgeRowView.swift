//
//  HomeBadgeRowView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/19.
//

import SwiftUI

struct HomeBadgeRowView: View {
    
//    @ObservedObject private var viewModel = BadgeViewModel()
    
    var body: some View {
        
        HStack(spacing: 16) {
            
            Image("물음표")
                .resizable()
                .frame(width: 66, height: 66)
                .cornerRadius(33)
            
            VStack(spacing: 8) {
                
                Text("나의 배지")
                    .font(Font.pretendard(.bold, size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                
                Text("운동을 하여 배지를 획득해 보세요!")
                    .font(.system(size: 16, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: 120, alignment: .leading)
        .background(Color.box_color)
        .cornerRadius(10)
    }
}

struct HomeBadgeRowView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBadgeRowView()
    }
}

