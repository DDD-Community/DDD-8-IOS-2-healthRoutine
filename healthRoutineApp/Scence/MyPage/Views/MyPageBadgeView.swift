//
//  MyPageBadgeView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/23.
//

import SwiftUI

struct MyPageBadgeView: View {
    var body: some View {
        
        VStack {
            
            VStack {
                
                HStack {
                
                    ZStack {
                        
                        Circle()
                            .fill(Color.green)
                            .frame(width: 65, height: 65)
                        
                        Text("선택함")
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("물먹는 슈퍼 하마왕")
                            .bold()
                        
                        Text("수분 섭취 목표 2달 달성")
                            .fontWeight(.regular)
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                    }
                }
                
                
                HStack {
                    ForEach(1..<6) {
                        CircleListView(label: "뱃지 \($0)")
                            .foregroundColor(.white)
                    }
                }
                .padding([.leading, .trailing], 10)

                HStack {
                    ForEach(7..<12) {
                        CircleListView(label: "뱃지 \($0)")
                            .foregroundColor(.white)
                    }
                }
                .padding([.leading, .trailing], 10)
            }
            .frame(maxWidth: .infinity, minHeight: 280, alignment: .leading)
            .background(.yellow)
            .cornerRadius(20)
        }
    }
}

struct MyPageBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageBadgeView()
    }
}
