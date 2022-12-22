//
//  MyPageDetailProfileModifyView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/22.
//

import SwiftUI

struct MyPageDetailProfileModifyView: View {
    
    @ObservedObject var viewModel = MyPageDetailProfileModifyViewModel()
    
    var body: some View {
        
        VStack {
            
            Circle()
                .fill(Color.blue)
                .frame(width: 132, height: 132)
                .overlay(Rectangle().frame(width: 30, height: 30).offset(x: 50, y:50) )
            
            VStack {
                
                TextField("변경하실 닉네임을 입력해주세요", text: $viewModel.nickname)
                   
                Divider()
                
            }.padding(.top, 24)
        }
    }
}

struct MyPageDetailProfileModifyView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageDetailProfileModifyView()
    }
}
