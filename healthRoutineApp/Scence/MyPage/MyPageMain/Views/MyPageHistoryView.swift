//
//  MyPageHistoryView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/23.
//

import SwiftUI

struct MyPageHistoryView: View {
    
//    @State var months: [String] = []
    
    var body: some View {
 
        VStack {
            
            Text("운동 히스토리")
                .font(Font.pretendard(.bold, size: 20))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack {
                
                Image("leftAngleBracket")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 8, height: 12)
                   
                Spacer()
                
                ScrollView(.horizontal) {
                    
                    
                    
                    HStack(alignment: .center) {
                        
                        ForEach(1..<5) {
                            CircleListView(label: "\($0) 월")
                        }
                    }
                }
                
                Spacer()
                
                Image("rightAngleBracket")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 8, height: 12)
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: 160)
        .background(Color.box_color)
        .cornerRadius(20)
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
        }
    }
}

struct MyPageHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageHistoryView()
    }
}
