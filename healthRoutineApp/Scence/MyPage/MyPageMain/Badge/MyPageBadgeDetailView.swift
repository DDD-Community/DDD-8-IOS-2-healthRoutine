//
//  MyPageBadgeDetailView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/18.
//

import SwiftUI

struct MyPageBadgeDetailView: View {
    
    @State var badge: Badge = .sincerityPro
    
    var body: some View {
        
        VStack {
            
            Image(badge.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
            
            Text(badge.title)
                .foregroundColor(.white_text)
                .frame(height: 20)
                .font(Font.pretendard(.bold, size: 18))
            
            Text(badge.desc)
                .foregroundColor(Color(hex: "AAB2B8"))
                .frame(height: 20)
                .font(Font.pretendard(.regular, size: 14))
            
            Text(badge.subDesc)
                .foregroundColor(.white_text)
                .frame(height: 20)
                .font(Font.pretendard(.semiBold, size: 16))
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.box_color)
    }
}

struct MyPageBadgeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageBadgeDetailView()
    }
}
