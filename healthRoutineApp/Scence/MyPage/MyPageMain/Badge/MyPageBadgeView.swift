//
//  MyPageBadgeView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/23.
//

import SwiftUI

struct MyPageBadgeView: View {
    
    @State private var isPresented = false
    @Environment(\.presentationMode) var presentationMode
    
    private let columns = [
        GridItem(.flexible()),GridItem(.flexible()),
        GridItem(.flexible()),GridItem(.flexible())
    ]
    
    var badgeTest: Badge = .water
    
    var body: some View {
        
        LazyVStack(alignment: .leading) {
            
            HStack(spacing: 16) {
                
                Image(badgeTest.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text(badgeTest.title)
                        .font(Font.pretendard(.bold, size: 20))
                        .foregroundColor(.white)
                        .frame(height: 31)
                    
                    Text(badgeTest.desc)
                        .font(Font.pretendard(.semiBold, size: 14))
                        .foregroundColor(.white)
                        .frame(height: 31)
                }
            }
            
            LazyVGrid(columns: columns) {
                
                ForEach(Badge.allCases, id: \.self) { badge in
                    
                    Image(badge.icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .onTapGesture {
                            self.isPresented.toggle()
                        }
                        .fullScreenCover(isPresented: self.$isPresented) {
                            MyPageBadgeDetailView()
                                .background(ClearBackgroundView())
                        }
                        .onAppear { UIView.setAnimationsEnabled(false) }
                }
            }
        }
        .padding(24)
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
