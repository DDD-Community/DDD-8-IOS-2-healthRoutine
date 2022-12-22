//
//  MyPageProfileView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/23.
//

import SwiftUI

struct MyPageProfileView: View {
    
    @ObservedObject var viewModel = MyPageMainViewModel()
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Circle()
                    .fill(Color.blue)
                    .frame(width: 120, height: 120)
                    .padding(20)
                
                Text("햄스터 갱스터")
                    .fontWeight(.bold)
                    .font(.title)
            }
            
            CustomNavigationLink(destination: MyPageDetailView().customNavigationTitle("닉네임 수정")
            ) {
                Text("프로필 수정")
                    .frame(maxWidth: .infinity, minHeight: 60)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.black)
                    .background(Color(.darkGray))
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 200)
        .background(.yellow)
        .cornerRadius(20)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageProfileView()
    }
}
