//
//  MyPageProfileView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/23.
//

import SwiftUI

struct MyPageProfileView: View {
    
    var body: some View {

        HStack() {
            
            Circle()
              .fill(Color.blue)
              .frame(width: 120, height: 120)
              .padding(20)
            
            VStack(alignment: .leading, spacing: 15) {
                
                Text("햄스터 갱스터")
                    .fontWeight(.bold)
                    .font(.title)
                
                Button {
                    
                    debugPrint("Show Profile View")
                    
                } label: {
                    
                    Text("프로필 수정")
                        .frame(width: 160, height: 40)
                        .background(.gray)
                        .cornerRadius(30)
                }
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 200)
        .background(.yellow)
        .cornerRadius(20)
        .padding(20)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageProfileView()
    }
}
