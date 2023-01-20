//
//  MyPageHistoryView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/23.
//

import SwiftUI

struct MyPageHistoryView: View {
    
    var body: some View {
 
        VStack {
            
            Text("운동 히스토리")
                .font(Font.pretendard(.bold, size: 20))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack(alignment: .center) {
                
                ForEach(1..<6) {
                    Spacer()
                    CircleListView(label: "\($0) 월")
                    Spacer()
                }
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: 160)
        .background(Color.box_color)
        .cornerRadius(10)
    }
}

struct CircleListView: View {
    
    @State var label: String
    
    var body: some View {
        ZStack {
            
            Circle()
                .fill(Color(hex: "353535"))
                .frame(width: 60, height: 60)
            
            Text(label)
                .foregroundColor(.black)
                .font(Font.pretendard(.bold, size: 14))
        }
    }
}

struct MyPageHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageHistoryView()
    }
}
