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
                .fontWeight(.semibold)
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading], 20)

            HStack {
                
                Image(systemName: "lessthan")
                    .padding([.leading], 15)
                
                ScrollView(.horizontal) {
                    
                    HStack(alignment: .center) {
                        
                        ForEach(1..<5) {
                            CircleListView(label: "\($0) 월")
                                .foregroundColor(.white)
                        }
                    }
                }
                .frame(height: 60)
                
                Image(systemName: "greaterthan")
                    .padding([.trailing], 15)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 160)
        .background(.yellow)
        .cornerRadius(20)
    }
}

struct CircleListView: View {
    
    @State var label: String
    
    var body: some View {
        ZStack {
            
            Circle()
                .fill(Color.green)
                .frame(width: 60, height: 60)
            
            Text(label)
        }
    }
}

struct MyPageHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageHistoryView()
    }
}
