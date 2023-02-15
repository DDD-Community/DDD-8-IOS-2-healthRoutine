//
//  MyPageBadgeDetailView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/18.
//

import SwiftUI

struct MyPageBadgeDetailView: View {
    
    @ObservedObject var viewModel: BadgeViewModel
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            if let badgeInfo = self.viewModel.selectedBadge, let icon = badgeInfo.image {
                
                Image(uiImage: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                
                Text(badgeInfo.title)
                    .foregroundColor(.white_text)
                    .frame(height: 20)
                    .font(Font.pretendard(.bold, size: 18))
                
                Text(badgeInfo.desc)
                    .foregroundColor(Color(hex: "AAB2B8"))
                    .frame(height: 20)
                    .font(Font.pretendard(.regular, size: 14))
                
                Text(badgeInfo.subDesc)
                    .foregroundColor(.white_text)
                    .frame(height: 20)
                    .font(Font.pretendard(.semiBold, size: 16))
                
            }
        
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.box_color)
    }
}

struct MyPageBadgeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageBadgeDetailView(viewModel: BadgeViewModel())
    }
}
