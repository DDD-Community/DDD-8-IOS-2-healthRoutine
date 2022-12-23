//
//  MyPageBadgeView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/23.
//

import SwiftUI

struct MyPageBadgeView: View {
    
    let badgeName: [String] = ["뱃지1", "뱃지2", "뱃지3", "뱃지4", "뱃지5", "뱃지6", "뱃지7", "뱃지7", "뱃지8", "뱃지8"]
    
    var body: some View {
        
        VStack {
            
            //            HStack {
            //
            //                Circle()
            //                    .fill(Color.green)
            //                    .frame(width: 66, height: 66)
            //
            //                VStack(alignment: .leading) {
            //
            //                    Text("물먹는 슈퍼 하마왕")
            //                        .font(.system(size: 20, weight: .bold))
            //
            //                    Text("수분 섭취 목표 2달 달성")
            //                        .font(.system(size: 14, weight: .semibold))
            //                        .foregroundColor(.gray)
            //                }
            //
            //                Spacer()
            //            }
            
            
            
            ForEach(badgeName, id: \.self) { i in
                
                HStack {
                    
                    Circle()
                        .fill(Color.cyan)
                        .frame(width: 65, height: 65)
                    
                    //                        Text(i)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 268)
        .background(.yellow)
        .cornerRadius(10)
    }
}

struct MyPageBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageBadgeView()
    }
}
