//
//  HomeBadgeRowView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/19.
//

import SwiftUI

struct HomeBadgeRowView: View {
    
    var body: some View {
        
        HStack(spacing: 16) {
            
            Image("ProfileDefault")
                .resizable()
                .frame(width: 66, height: 66)
                .cornerRadius(33)
            
            VStack(spacing: 8) {
                
                Text("물먹는 하마")
                    .font(Font.pretendard(.bold, size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                
                Text("2달연속으로 수분 섭취 성공")
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

