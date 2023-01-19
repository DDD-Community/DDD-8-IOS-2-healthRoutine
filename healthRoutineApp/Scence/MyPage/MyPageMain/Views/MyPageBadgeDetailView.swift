//
//  MyPageBadgeDetailView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/18.
//

import SwiftUI

struct MyPageBadgeDetailView: View {
    
    @State var badge: Badge = .water
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Image(badge.icon)
                        .resizable()
                        .scaledToFit()
                        .padding(.top, 31)
                    
                    Text(badge.title)
                        .foregroundColor(.white_text)
                        .font(Font.pretendard(.bold, size: 18))
                        .padding(.bottom, 5)
                    
                    Text(badge.desc)
                        .foregroundColor(Color(hex: "AAB2B8"))
                        .font(Font.pretendard(.regular, size: 14))
                        .padding(.bottom, 19)
                    
                    Text(badge.subDesc)
                        .foregroundColor(.white_text)
                        .font(Font.pretendard(.semiBold, size: 16))
                        .padding(.bottom, 31)
                }
                .frame(maxWidth: .infinity, maxHeight: 254)
                .background(Color.box_color)
                .cornerRadius(10)
                .padding(20)
                
                Spacer()
            }
            
        }.background(Color(hex: "000000"))
    }
}

struct MyPageBadgeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageBadgeDetailView()
    }
}
